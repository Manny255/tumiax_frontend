import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/dio_client.dart';

import '../data/datasources/location_remote_datasource.dart';
import '../data/models/location_model.dart';
import '../data/repositories/location_repository_impl.dart';
import '../data/repositories/location_repository.dart';
import '../data/domain/usecases/get_location_usecase.dart';
import '../presentation/controllers/location_controller.dart';

final locationRemoteDataSourceProvider = Provider<LocationRemoteDataSource>((
  ref,
) {
  final dio = ref.read(dioProvider);
  return LocationRemoteDataSource(dio);
});

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepositoryImpl(ref.read(locationRemoteDataSourceProvider));
});

final getLocationUseCaseProvider = Provider<GetLocationUseCase>((ref) {
  return GetLocationUseCase(ref.read(locationRepositoryProvider));
});

final locationControllerProvider =
    AsyncNotifierProvider<LocationController, LocationModel?>(
      LocationController.new,
    );
