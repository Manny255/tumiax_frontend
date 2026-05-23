import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import '../models/location_model.dart';

class LocationRemoteDataSource {
  final Dio dio;

  LocationRemoteDataSource(this.dio);

Future<LocationModel> getLocation() async {
    // 0️⃣ Check if location service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled. Please enable GPS.");
    }

    // 1️⃣ Check permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception("Location permission denied");
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied");
    }

    // 2️⃣ Get precise GPS
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
      ),
    );

    // 3️⃣ Call backend
    final response = await dio.post(
      "/location/reverse-geocode/",
      data: {"latitude": position.latitude, "longitude": position.longitude},
    );

    return LocationModel(
      gpsAddress: response.data["gps_address"],
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
