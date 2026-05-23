import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_document_model.freezed.dart';
part 'insurance_document_model.g.dart';

@freezed
sealed class InsuranceDocumentModel with _$InsuranceDocumentModel {
  const factory InsuranceDocumentModel({
    required int id,
    required String file,

    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'file_size') required int fileSize,
    @JsonKey(name: 'mime_type') required String mimeType,
    @JsonKey(name: 'uploaded_at') required DateTime uploadedAt,
  }) = _InsuranceDocumentModel;

  factory InsuranceDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceDocumentModelFromJson(json);
}
