// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppVersionModel _$AppVersionModelFromJson(Map<String, dynamic> json) =>
    _AppVersionModel(
      version: json['version'] as String,
      minVersion: json['min_version'] as String,
      platform: json['platform'] as String,
      forceUpdate: json['force_update'] as bool,
      updateUrl: json['update_url'] as String?,
      releaseNotes: json['release_notes'] as String?,
    );

Map<String, dynamic> _$AppVersionModelToJson(_AppVersionModel instance) =>
    <String, dynamic>{
      'version': instance.version,
      'min_version': instance.minVersion,
      'platform': instance.platform,
      'force_update': instance.forceUpdate,
      'update_url': instance.updateUrl,
      'release_notes': instance.releaseNotes,
    };
