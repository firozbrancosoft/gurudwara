import '../../../../core/enums/location_status.dart';
import 'location_service_interface.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class LocationService implements LocationServiceInterface {
  @override
  Future<LocationStatus> checkLocationPermission() async {
    final permission = await Permission.location.status;

    if (permission.isGranted) {
      return LocationStatus.granted;
    } else if (permission.isPermanentlyDenied) {
      return LocationStatus.permanentlyDenied;
    } else if (permission.isDenied) {
      return LocationStatus.denied;
    } else {
      return LocationStatus.unknown;
    }
  }

  @override
  Future<LocationStatus> requestLocationPermission() async {
    final permission = await Permission.location.request();

    if (permission.isGranted) {
      return LocationStatus.granted;
    } else if (permission.isPermanentlyDenied) {
      return LocationStatus.permanentlyDenied;
    } else if (permission.isDenied) {
      return LocationStatus.denied;
    } else {
      return LocationStatus.unknown;
    }
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Future<void> openAppSettings() async {
    await openAppSettings();
  }

  @override
  Future<Map<String, double>> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return {
        'latitude': position.latitude,
        'longitude': position.longitude,
      };
    } catch (e) {
      // Return default location (Delhi) if location access fails
      return {
        'latitude': 28.6139,
        'longitude': 77.2090,
      };
    }
  }
}
