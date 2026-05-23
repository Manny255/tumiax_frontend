import '../datasources/location_remote_datasource.dart';
import '../models/location_model.dart';
import 'location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<LocationModel> getLocation() {
    return remoteDataSource.getLocation();
  }
}
