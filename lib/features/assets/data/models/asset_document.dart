// lib/features/assets/data/models/asset_document.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_document.freezed.dart';
part 'asset_document.g.dart';

@freezed
sealed class AssetDocumentModel with _$AssetDocumentModel {
  const factory AssetDocumentModel({
    required String id,

    @JsonKey(name: 'document_type') required String documentType,

    // File info
    String? file,
    @JsonKey(name: 'file_url') String? fileUrl,
    @JsonKey(name: 'file_name') String? fileName,
    @JsonKey(name: 'file_size') int? fileSize,
    @JsonKey(name: 'mime_type') String? mimeType,

    // Status
    required String status,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,

    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _AssetDocumentModel;

  factory AssetDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$AssetDocumentModelFromJson(json);
}

// Document type enum for better type safety
enum DocumentType {
  photo('PHOTO'),
  purchaseReceipt('PURCHASE_RECEIPT'),
  title('TITLE'),
  insurance('INSURANCE'),
  inspection('INSPECTION'),
  valuation('VALUATION'),
  other('OTHER');

  final String value;
  const DocumentType(this.value);

  static DocumentType fromString(String value) {
    return DocumentType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => DocumentType.other,
    );
  }
}

// Document status enum
enum DocumentStatus {
  pending('PENDING'),
  approved('APPROVED'),
  rejected('REJECTED');

  final String value;
  const DocumentStatus(this.value);

  static DocumentStatus fromString(String value) {
    return DocumentStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => DocumentStatus.pending,
    );
  }

  bool get isPending => this == DocumentStatus.pending;
  bool get isApproved => this == DocumentStatus.approved;
  bool get isRejected => this == DocumentStatus.rejected;
}
