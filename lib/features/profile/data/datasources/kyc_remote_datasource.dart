

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import '../models/kyc_lookup_model.dart';
import '../models/kyc_model.dart';

abstract class KYCRemoteDataSource {
  Future<KYCProfile> getKYCProfile();
  Future<KYCLookupModel> getKYCLookup(String email);
  Future<KYCProfile> submitKYC(KYCSubmission request);
  Future<KYCProfile> submitKYCWithFiles(KYCSubmissionWithFiles submission);
  Future<Map<String, dynamic>> getKYCStatus();
  Future<void> uploadDocument(String filePath, String documentType);
}

class KYCRemoteDataSourceImpl implements KYCRemoteDataSource {
  final Dio dio;

  KYCRemoteDataSourceImpl(this.dio);

  // =====================================================
  // PUBLIC METHODS
  // =====================================================

  @override
  Future<KYCProfile> getKYCProfile() async {
    try {
      final response = await dio.get('/compliance/kyc/me/');
      return KYCProfile.fromJson(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }


  @override
  Future<KYCLookupModel> getKYCLookup(String email) async {
    try {
      final response = await dio.get(
        '/compliance/kyc/lookup/',
        queryParameters: {'email': email},
      );

      return KYCLookupModel.fromJson(Map<String, dynamic>.from(response.data));
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  @override
  Future<KYCProfile> submitKYC(KYCSubmission request) async {
    try {
      final response = await dio.post(
        '/compliance/kyc/submit/',
        data: request.toJson(),
      );

      return KYCProfile.fromJson(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  @override
  Future<KYCProfile> submitKYCWithFiles(
    KYCSubmissionWithFiles submission,
  ) async {
    try {
      final formData = FormData();

      // -------- Add form fields --------
      final fields = _buildFieldMap(submission);

      formData.fields.addAll(
        fields.entries.map(
          (e) => MapEntry(e.key, e.value),
        ),
      );

      // -------- Attach files --------
      await _attachFile(formData, 'id_front', submission.idFrontFile);
      await _attachFile(formData, 'id_back', submission.idBackFile);
      await _attachFile(formData, 'selfie', submission.selfieFile);
      await _attachFile(
        formData,
        'proof_of_address',
        submission.proofOfAddressFile,
        allowPdf: true,
      );

      final response = await dio.post(
        '/compliance/kyc/submit/',
        data: formData,
      );

      return KYCProfile.fromJson(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getKYCStatus() async {
    try {
      final response = await dio.get('/compliance/kyc/status/');
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  @override
  Future<void> uploadDocument(
    String filePath,
    String documentType,
  ) async {
    try {
      final file = File(filePath);

      if (!file.existsSync()) {
        throw Exception('File does not exist');
      }

      final formData = FormData.fromMap({
        'document_type': documentType,
        'document': await MultipartFile.fromFile(
          file.path,
          filename: path.basename(file.path),
        ),
      });

      await dio.post(
        '/compliance/kyc/upload/',
        data: formData,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  // =====================================================
  // INTERNAL HELPERS
  // =====================================================

  Map<String, String> _buildFieldMap(
    KYCSubmissionWithFiles submission,
  ) {
    final data = submission.data;

    final Map<String, String?> raw = {
      'full_name': data.fullName,
      'date_of_birth': _formatDate(data.dateOfBirth),
      'nationality': data.nationality,
      'id_type': data.idType,
      'id_number': data.idNumber,
      'phone_number': data.phoneNumber,
      'id_country': data.idCountry,
      'id_expiry_date': _formatDate(data.idExpiryDate),
      'address_line1': data.addressLine1,
      'address_line2': data.addressLine2,
      'city': data.city,
      'state': data.state,
      'postal_code': data.postalCode,
      'country': data.country,
      'employment_status': data.employmentStatus,
      'occupation': data.occupation,
      'employer': data.employer,
      'annual_income': data.annualIncome?.toString(),
    };

    // Remove null or empty values safely
    raw.removeWhere(
      (key, value) => value == null || value.isEmpty,
    );

    return raw.map(
      (key, value) => MapEntry(key, value!),
    );
  }

  Future<void> _attachFile(
    FormData formData,
    String fieldName,
    File? file, {
    bool allowPdf = false,
  }) async {
    if (file == null) return;

    if (!file.existsSync()) {
      throw Exception('$fieldName file does not exist');
    }

    final ext = path.extension(file.path).toLowerCase();

    final allowedExtensions = allowPdf
        ? ['.jpg', '.jpeg', '.png', '.pdf']
        : ['.jpg', '.jpeg', '.png'];

    if (!allowedExtensions.contains(ext)) {
      throw Exception(
        'Invalid file type for $fieldName. Allowed: $allowedExtensions',
      );
    }

    final filename =
        '${fieldName}_${DateTime.now().millisecondsSinceEpoch}$ext';

    formData.files.add(
      MapEntry(
        fieldName,
        await MultipartFile.fromFile(
          file.path,
          filename: filename,
        ),
      ),
    );
  }

  String? _formatDate(DateTime? date) {
    if (date == null) return null;
    return date.toIso8601String().split('T').first;
  }

  Exception _mapDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;

      if (data is Map<String, dynamic>) {
        if (data.containsKey('message')) {
          return Exception(data['message']);
        }
        return Exception(data.toString());
      }

      return Exception(
        'Server error ($statusCode)',
      );
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Exception('Connection timeout');
      case DioExceptionType.receiveTimeout:
        return Exception('Receive timeout');
      case DioExceptionType.sendTimeout:
        return Exception('Send timeout');
      case DioExceptionType.badCertificate:
        return Exception('Bad SSL certificate');
      case DioExceptionType.connectionError:
        return Exception('No internet connection');
      case DioExceptionType.cancel:
        return Exception('Request cancelled');
      default:
        return Exception(
          'Network error: ${e.message}',
        );
    }
  }
}
