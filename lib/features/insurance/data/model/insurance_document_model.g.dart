// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InsuranceDocumentModel _$InsuranceDocumentModelFromJson(
  Map<String, dynamic> json,
) => _InsuranceDocumentModel(
  id: (json['id'] as num).toInt(),
  file: json['file'] as String,
  fileName: json['file_name'] as String,
  fileSize: (json['file_size'] as num).toInt(),
  mimeType: json['mime_type'] as String,
  uploadedAt: DateTime.parse(json['uploaded_at'] as String),
);

Map<String, dynamic> _$InsuranceDocumentModelToJson(
  _InsuranceDocumentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'file': instance.file,
  'file_name': instance.fileName,
  'file_size': instance.fileSize,
  'mime_type': instance.mimeType,
  'uploaded_at': instance.uploadedAt.toIso8601String(),
};
