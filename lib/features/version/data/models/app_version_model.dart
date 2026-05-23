import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_model.freezed.dart';
part 'app_version_model.g.dart';

@freezed
sealed class AppVersionModel with _$AppVersionModel {
  const factory AppVersionModel({
    required String version,
    @JsonKey(name: 'min_version') required String minVersion,
    required String platform,
    @JsonKey(name: 'force_update') required bool forceUpdate,
    @JsonKey(name: 'update_url') String? updateUrl,
    @JsonKey(name: 'release_notes') String? releaseNotes,
  }) = _AppVersionModel;

  factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
      _$AppVersionModelFromJson(json);
}

extension AppVersionModelX on AppVersionModel {
  /// Compare current version with latest version
  /// Returns:
  /// -1 if current < latest (needs update)
  /// 0 if current == latest
  /// 1 if current > latest (shouldn't happen)
  int compareVersion(String currentVersion) {
    final current = _parseVersion(currentVersion);
    final latest = _parseVersion(version);

    for (int i = 0; i < 3; i++) {
      if (current[i] < latest[i]) return -1;
      if (current[i] > latest[i]) return 1;
    }
    return 0;
  }

  /// Check if current version meets minimum requirement
  bool isCompatible(String currentVersion) {
    final current = _parseVersion(currentVersion);
    final minimum = _parseVersion(minVersion);

    for (int i = 0; i < 3; i++) {
      if (current[i] < minimum[i]) return false;
      if (current[i] > minimum[i]) return true;
    }
    return true;
  }

  /// Parse version string "1.2.3" to list [1, 2, 3]
  List<int> _parseVersion(String version) {
    return version.split('.').map(int.parse).toList();
  }
}
