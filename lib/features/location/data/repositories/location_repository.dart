import '../models/location_model.dart';

abstract class LocationRepository {
  Future<LocationModel> getLocation();
}