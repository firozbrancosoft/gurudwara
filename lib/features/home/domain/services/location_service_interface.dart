import '../../../../core/enums/location_status.dart';

abstract class LocationServiceInterface {
  Future<LocationStatus> checkLocationPermission();
  Future<LocationStatus> requestLocationPermission();
  Future<bool> isLocationServiceEnabled();
  Future<void> openLocationSettings();
  Future<void> openAppSettings();
  Future<Map<String, double>> getCurrentLocation();
}
