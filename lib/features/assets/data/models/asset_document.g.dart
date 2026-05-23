// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetDocumentModel _$AssetDocumentModelFromJson(Map<String, dynamic> json) =>
    _AssetDocumentModel(
      id: json['id'] as String,
      documentType: json['document_type'] as String,
      file: json['file'] as String?,
      fileUrl: json['file_url'] as String?,
      fileName: json['file_name'] as String?,
      fileSize: (json['file_size'] as num?)?.toInt(),
      mimeType: json['mime_type'] as String?,
      status: json['status'] as String,
      rejectionReason: json['rejection_reason'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AssetDocumentModelToJson(_AssetDocumentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document_type': instance.documentType,
      'file': instance.file,
      'file_url': instance.fileUrl,
      'file_name': instance.fileName,
      'file_size': instance.fileSize,
      'mime_type': instance.mimeType,
      'status': instance.status,
      'rejection_reason': instance.rejectionReason,
      'created_at': instance.createdAt.toIso8601String(),
    };
