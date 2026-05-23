import '../../features/auth/data/models/user_model.dart';

enum AuthSessionStatus {
  booting,
  onboardingRequired,
  unauthenticated,
  emailVerificationRequired,
  authenticated,
}

class AuthSessionState {
  final AuthSessionStatus status;
  final String? email;
  final UserModel? user;

  const AuthSessionState({required this.status, this.email, this.user});

  AuthSessionState copyWith({
    AuthSessionStatus? status,
    String? email,
    UserModel? user,
  }) {
    return AuthSessionState(
      status: status ?? this.status,
      email: email ?? this.email,
      user: user ?? this.user,
    );
  }
}

// class AuthSessionState {
//   final AuthSessionStatus status;
//   final String? email;

//   const AuthSessionState({required this.status, this.email});

//   AuthSessionState copyWith({AuthSessionStatus? status, String? email}) {
//     return AuthSessionState (
//       status: status ?? this.status,
//       email: email ?? this.email,
//     );
//   }
// }
