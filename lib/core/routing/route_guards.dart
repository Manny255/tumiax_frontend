
import '../session/auth_session_state.dart';
import 'route_names.dart';

class RouteGuard {
  static String? redirect(AuthSessionState session, String location) {
    switch (session.status) {
      case AuthSessionStatus.booting:
        return location == RouteNames.splash ? null : RouteNames.splash;

      case AuthSessionStatus.onboardingRequired:
        return location == RouteNames.onboarding ? null : RouteNames.onboarding;

      case AuthSessionStatus.unauthenticated:
        if (location == RouteNames.login ||
            location == RouteNames.register ||
            location == RouteNames.onboarding) {
          return null;
        }
        return RouteNames.login;

      case AuthSessionStatus.emailVerificationRequired:
        final email = session.email;
        if (email == null || email.isEmpty) {
          return RouteNames.login;
        }
        final target = '${RouteNames.verifyEmail}?email=$email';

        if (location.startsWith(RouteNames.verifyEmail)) {
          return null;
        }
        return target;

      case AuthSessionStatus.authenticated:
        if (location == RouteNames.splash ||
            location == RouteNames.login ||
            location == RouteNames.register ||
            location == RouteNames.verifyEmail) {
          return RouteNames.home;
        }
        return null;
    }
  }
}


// import 'route_names.dart';


// class RouteGuard {
//   static String? redirect({
//     required bool isAuthenticated,
//     required bool onboardingSeen,
//     required bool loading,
//     required String location,
//   }) {
//     print(
//       'GUARD CHECK → location:$location '
//       'auth:$isAuthenticated '
//       'onboarding:$onboardingSeen '
//       'loading:$loading',
//     );

//     // Stay on splash while loading
//     if (loading) {
//       print('GUARD → loading → splash');
//       return location == RouteNames.splash ? null : RouteNames.splash;
//     }

//     // Exit splash once loading finishes
//     if (location == RouteNames.splash) {
//       print('GUARD → exiting splash');

//       if (!onboardingSeen) {
//         print('GUARD → onboarding');
//         return RouteNames.onboarding;
//       }

//       if (!isAuthenticated) {
//         print('GUARD → login');
//         return RouteNames.login;
//       }

//       print('GUARD → home');
//       return RouteNames.home;
//     }

//     final authPages =
//         location == RouteNames.login ||
//         location == RouteNames.register ||
//         location == RouteNames.verifyEmail;

//     print('GUARD → authPages:$authPages');

//     if (!isAuthenticated && !authPages) {
//       print('GUARD → redirect login');
//       return RouteNames.login;
//     }

//     if (isAuthenticated && authPages) {
//       print('GUARD → redirect home');
//       return RouteNames.home;
//     }

//     print('GUARD → allow');
//     return null;
//   }
// }

// class RouteGuard {
//   static String? redirect({
//     required bool isAuthenticated,
//     required bool onboardingSeen,
//     required bool loading,
//     required String location,
//   }) {
//     // Stay on splash while loading
//     if (loading) {
//       return location == RouteNames.splash ? null : RouteNames.splash;
//     }

//     // Exit splash once loading finishes
//     if (location == RouteNames.splash) {
//       if (!onboardingSeen) {
//         return RouteNames.onboarding;
//       }

//       if (!isAuthenticated) {
//         return RouteNames.login;
//       }

//       return RouteNames.home;
//     }

//     // Onboarding protection
//     if (!onboardingSeen && location != RouteNames.onboarding) {
//       return RouteNames.onboarding;
//     }

//     if (onboardingSeen && location == RouteNames.onboarding) {
//       return isAuthenticated ? RouteNames.home : RouteNames.login;
//     }

//     final authPages =
//         location == RouteNames.login ||
//         location == RouteNames.register ||
//         location == RouteNames.verifyEmail;

//     if (!isAuthenticated && !authPages) {
//       return RouteNames.login;
//     }

//     if (isAuthenticated && authPages) {
//       return RouteNames.home;
//     }

//     return null;
//   }
// }

// class RouteGuard {
//   static String? redirect({
//     required bool isAuthenticated,
//     required bool onboardingSeen,
//     required bool loading,
//     required String location,
//   }) {
//     if (loading) return RouteNames.splash;

//     if (!onboardingSeen) {
//       return location == RouteNames.onboarding ? null : RouteNames.onboarding;
//     }

//     final authPages =
//         location == RouteNames.login ||
//         location == RouteNames.register ||
//         location == RouteNames.verifyEmail;

//     if (!isAuthenticated) {
//       return authPages ? null : RouteNames.login;
//     }

//     if (isAuthenticated && authPages) {
//       return RouteNames.home;
//     }

//     return null;
//   }
  
// }

