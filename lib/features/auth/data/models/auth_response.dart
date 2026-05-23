// lib/features/auth/data/models/auth_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
sealed class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'access') required String accessToken,
    @JsonKey(name: 'refresh') required String refreshToken,
    @JsonKey(name: 'user') UserModel? user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
      
  factory AuthResponse.verifyEmailResponse(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['tokens']['access'],
      refreshToken: json['tokens']['refresh'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}


// import 'package:freezed_annotation/freezed_annotation.dart';
// // import 'user_model.dart';

// part 'auth_response.freezed.dart';
// part 'auth_response.g.dart';

// @freezed
// sealed class AuthResponse with _$AuthResponse {
//   const factory AuthResponse({
//     @JsonKey(name: 'access') required String accessToken,
//     @JsonKey(name: 'refresh') required String refreshToken,
//   }) = _AuthResponse;

//   factory AuthResponse.fromJson(Map<String, dynamic> json) =>
//       _$AuthResponseFromJson(json);
// }
