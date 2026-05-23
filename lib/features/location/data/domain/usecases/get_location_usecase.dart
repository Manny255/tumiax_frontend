import '../../models/location_model.dart';
import '../../repositories/location_repository.dart';

class GetLocationUseCase {
  final LocationRepository repository;

  GetLocationUseCase(this.repository);

  Future<LocationModel> call() {
    return repository.getLocation();
  }
}
