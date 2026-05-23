import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/storage/secure_storage.dart';

final onboardingSeenProvider = FutureProvider<bool>((ref) async {
  try {
    final storage = ref.read(secureStorageProvider);
    final value = await storage.read(StorageKeys.onboardingShown);
    return value == 'true';
  } catch (_) {
    return false;
  }
});
