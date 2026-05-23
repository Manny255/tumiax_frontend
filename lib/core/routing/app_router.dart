// lib/core/routing/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import '../../features/assets/presentation/pages/edit_asset_page.dart';
import '../../features/auth/presentation/pages/change_password_page.dart';
import '../../features/auth/presentation/pages/verify_email_page.dart';
import '../../features/auth/providers/onboarding_provider.dart';
import '../../features/credit/presentation/pages/pay_page.dart';
import '../../features/credit/presentation/pages/transactions_list_page.dart';
import '../../features/credit/presentation/pages/transfer_page.dart';
import '../../features/insurance/presentation/pages/add_insurance_page.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../features/payout/presentation/pages/add_payout_method_page.dart';
import '../../features/payout/presentation/pages/manage_payout_methods_page.dart';
import '../../features/profile/presentation/pages/kyc_verification_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/settings_page.dart';
import '../../features/version/presentation/widgets/version_check_wrapper.dart';
import '../session/auth_session_provider.dart';
import 'route_guards.dart';
import 'route_names.dart';
import '../../features/auth/providers/auth_providers.dart';

import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/dashboard/presentation/pages/home_page.dart';
import '../../features/assets/presentation/pages/assets_list_page.dart';
import '../../features/assets/presentation/pages/add_asset_page.dart';
import '../../features/assets/presentation/pages/asset_detail_page.dart';
import '../../features/credit/presentation/pages/credit_page.dart';
import '../../features/wallet/presentation/pages/wallet_page.dart';
import '../../features/profile/presentation/pages/kyc_page.dart';
import '../../shared/widgets/main_scaffold.dart';

// final routerProvider = Provider<GoRouter>((ref) {
//   final routeState = ref.watch(appRouteStateProvider);

//   return GoRouter(
//     initialLocation: RouteNames.splash,
//     debugLogDiagnostics: true,

//     redirect: (context, state) {
//       return RouteGuard.redirect(
//         isAuthenticated: routeState.isAuthenticated,
//         onboardingSeen: routeState.onboardingSeen,
//         loading: routeState.loading,
//         location: state.matchedLocation,
//       );
//     },

// final routerProvider = Provider<GoRouter>((ref) {
//   final routeState = ref.watch(appRouteStateProvider);
//   final refreshNotifier = ref.watch(routerRefreshProvider);

//   return GoRouter(
//     initialLocation: RouteNames.splash,
//     debugLogDiagnostics: true,

//     /// This fixes router not rebuilding
//     refreshListenable: refreshNotifier,

//     redirect: (context, state) {
//       return RouteGuard.redirect(
//         isAuthenticated: routeState.isAuthenticated,
//         onboardingSeen: routeState.onboardingSeen,
//         loading: routeState.isLoading,
//         location: state.matchedLocation,
//       );
//     },
final routerProvider = Provider<GoRouter>((ref) {
  final session = ref.watch(authsessionProvider);

  return GoRouter(
    debugLogDiagnostics: true,

    redirect: (context, state) {
      return RouteGuard.redirect(session, state.uri.path);
    },

    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.register,
        name: RouteNames.register,
        builder: (context, state) => const RegisterPage(),
      ),
     GoRoute(
        path: RouteNames.verifyEmail,
        name: RouteNames.verifyEmail,
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';
          return VerifyEmailPage(email: email);
        },
      ),
       ShellRoute(
        builder: (context, state, child) =>
            VersionCheckWrapper(child: MainScaffold(child: child)),
        routes: [
          GoRoute(
            path: RouteNames.home,
            name: RouteNames.home,
            builder: (context, state) => const HomePage(),
          ),

          GoRoute(
            path: RouteNames.assets,
            name: RouteNames.assets,
            builder: (context, state) => const AssetListPage(),
            routes: [
               GoRoute(
                path: 'add',
                name: RouteNames.addAsset,
                builder: (context, state) => const AddAssetPage(),
              ),
              // Asset Detail with dynamic ID
              GoRoute(
                path: ':id',
                name: RouteNames.assetDetail,
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return AssetDetailPage(assetId: id);
                },
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: RouteNames.editAsset,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return EditAssetPage(assetId: id);
                    },
                  ),
                  // GoRoute(
                  //   path: 'documents',
                  //   name: RouteNames.assetDocuments,
                  //   builder: (context, state) {
                  //     final id = state.pathParameters['id']!;
                  //     return AssetDocumentsPage(assetId: id);
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: ':docId',
                  //       name: RouteNames.assetDocumentView,
                  //       builder: (context, state) {
                  //         final assetId = state.pathParameters['id']!;
                  //         final docId = state.pathParameters['docId']!;
                  //         return AssetDocumentViewPage(
                  //           assetId: assetId,
                  //           documentId: docId,
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // GoRoute(
                  //   path: 'valuation',
                  //   name: RouteNames.assetValuation,
                  //   builder: (context, state) {
                  //     final id = state.pathParameters['id']!;
                  //     return AssetValuationPage(assetId: id);
                  //   },
                  // ),
                ],
              ),
            ],
          ),
          // GoRoute(
          //   path: RouteNames.assets,
          //   name: RouteNames.assets,
          //   builder: (context, state) => const AssetListPage(),
          //   routes: [
          //     GoRoute(
          //       path: 'add',
          //       name: 'add-asset',
          //       builder: (context, state) => const AddAssetPage(),
          //     ),
          //     GoRoute(
          //       path: ':id',
          //       name: 'asset-detail',
          //       builder: (context, state) {
          //         final id = state.pathParameters['id']!;
          //         return AssetDetailPage(assetId: id);
          //       },
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: RouteNames.wallet,
          //   name: RouteNames.wallet,
          //   builder: (context, state) => const WalletPage(),
          // ),
          GoRoute(
            path: RouteNames.kycVerification,
            name: RouteNames.kycVerification,
            builder: (context, state) => const KYCVerificationPage(),
          ),
          GoRoute(
            path: RouteNames.notifications,
            name: RouteNames.notifications,
            builder: (context, state) => const NotificationsPage(),
          ),
          GoRoute(
            path: RouteNames.credit,
            name: RouteNames.credit,
            builder: (context, state) => const CreditPage(),
          ),
          GoRoute(
            path: RouteNames.pay,
            name: RouteNames.pay,
            builder: (context, state) => const PayPage(),
          ),
          GoRoute(
            path: RouteNames.transefer,
            name: RouteNames.transefer,
            builder: (context, state) => const TransferPage(),
          ),
           GoRoute(
            path: RouteNames.addPayoutMethod,
            name: RouteNames.addPayoutMethod,
            builder: (context, state) => const AddPayoutMethodPage(),
          ),
          GoRoute(
            path: RouteNames.managePayoutMethods,
            name: RouteNames.managePayoutMethods,
            builder: (context, state) => const ManagePayoutMethodsPage(),
          ),
          GoRoute(
            path: RouteNames.settings,
            name: RouteNames.settings,
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: RouteNames.kyc,
            name: RouteNames.kyc,
            builder: (context, state) => const KYCPage(),
          ),

          GoRoute(
            path: RouteNames.transactions,
            name: RouteNames.transactions,
            builder: (context, state) => const TransactionsListPage(),
          ),

           GoRoute(
            path: RouteNames.profile,
            name: RouteNames.profile,
            builder: (context, state) => const ProfilePage(),
          ),

          //  GoRoute(
          //   path: RouteNames.assets,
          //   name: RouteNames.assets,
          //   builder: (context, state) => const AssetListPage(),
          // ),
           GoRoute(
            path: '/insurance/add',
            name: RouteNames.addInsurance,
            builder: (context, state) {
              return AddInsurancePage();
            },
          ),

          GoRoute(
            path: RouteNames.changePassword,
            name: RouteNames.changePassword,
            builder: (context, state) => const ChangePasswordPage(),
          ),
          // GoRoute(
          //   path: RouteNames.pinSetup,
          //   name: RouteNames.pinSetup,
          //   builder: (context, state) => const PinSetupPage(),
          // ),

          // GoRoute(
          //   path: RouteNames.insurance,
          //   name: RouteNames.insurance,
          //   // builder: (context, state) =>
          //   //     const InsurancePage(),
          //   routes: [
          //     GoRoute(
          //       path: 'add',
          //       name: RouteNames.addInsurance,
          //       builder: (context, state) {
          //         return AddInsurancePage();
          //       },
          //     ),
          //     // GoRoute(
          //     //   path: ':id',
          //     //   name: RouteNames.insuranceDetail,
          //     //   builder: (context, state) {
          //     //     final id = state.pathParameters['id']!;
          //     //     return InsuranceDetailPage(insuranceId: id);
          //     //   },
          //     // ),
          //   ],
          // ),
        ],
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
});
