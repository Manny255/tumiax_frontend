import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { online, offline }

final connectivityProvider = StreamProvider<ConnectivityStatus>((ref) {
  return Connectivity().onConnectivityChanged.map((results) {
    final isOffline = results.every((r) => r == ConnectivityResult.none);

    return isOffline ? ConnectivityStatus.offline : ConnectivityStatus.online;
  });
});

final connectivityInitialProvider = FutureProvider<ConnectivityStatus>((
  ref,
) async {
  final connectivity = Connectivity();

  final results = await connectivity.checkConnectivity();

  final isOffline = results.every((r) => r == ConnectivityResult.none);

  return isOffline ? ConnectivityStatus.offline : ConnectivityStatus.online;
});
