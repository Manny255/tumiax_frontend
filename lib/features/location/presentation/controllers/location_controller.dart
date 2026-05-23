import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/location_model.dart';
import '../../providers/location_provider.dart';

class LocationController extends AsyncNotifier<LocationModel?> {
  @override
  Future<LocationModel?> build() async {
    return null;
  }

  Future<void> getCurrentLocation() async {
    state = const AsyncLoading();

    try {
      final location = await ref.read(getLocationUseCaseProvider)();
      state = AsyncData(location);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
