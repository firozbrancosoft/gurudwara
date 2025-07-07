// File: lib/features/home/controllers/home_controller.dart
import 'package:get/get.dart';
import '../../../../core/enums/location_status.dart';
import '../domain/model/gurudwara_model.dart';
import '../domain/usecases/get_nearby_gurudwaras_usecase.dart';
import '../domain/usecases/search_gurudwaras_usecase.dart';
import '../domain/services/location_service_interface.dart';
import '../widget/location_permission_dialog.dart';

class HomeController extends GetxController {
  late final GetNearbyGurudwarasUseCase getNearbyGurudwarasUseCase;
  late final SearchGurudwarasUseCase searchGurudwarasUseCase;
  late final LocationServiceInterface locationService;

  final RxList<GurudwaraModel> gurudwaras = <GurudwaraModel>[].obs;
  final RxList<GurudwaraModel> filteredGurudwaras = <GurudwaraModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString searchQuery = ''.obs;
  final RxSet<String> favorites = <String>{}.obs;
  final Rx<Map<String, double>?> currentLocation = Rx<Map<String, double>?>(null);

  @override
  void onInit() {
    super.onInit();
    getNearbyGurudwarasUseCase = Get.find<GetNearbyGurudwarasUseCase>();
    searchGurudwarasUseCase = Get.find<SearchGurudwarasUseCase>();
    locationService = Get.find<LocationServiceInterface>();
    checkLocationAndLoadData();
  }

  Future<void> checkLocationAndLoadData() async {
    try {
      isLoading.value = true;
      final isLocationEnabled = await locationService.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        _showLocationServiceDialog();
        return;
      }

      final permissionStatus = await locationService.checkLocationPermission();
      if (permissionStatus == LocationStatus.granted) {
        await _getCurrentLocationAndLoadData();
      } else if (permissionStatus == LocationStatus.denied) {
        final requestStatus = await locationService.requestLocationPermission();
        if (requestStatus == LocationStatus.granted) {
          await _getCurrentLocationAndLoadData();
        } else if (requestStatus == LocationStatus.permanentlyDenied) {
          _showPermissionDialog();
        } else {
          _loadWithDefaultLocation();
        }
      } else if (permissionStatus == LocationStatus.permanentlyDenied) {
        _showPermissionDialog();
      } else {
        _loadWithDefaultLocation();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to check location: $e');
      _loadWithDefaultLocation();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _getCurrentLocationAndLoadData() async {
    try {
      final location = await locationService.getCurrentLocation();
      currentLocation.value = location;
      await _loadNearbyGurudwaras();
    } catch (e) {
      Get.snackbar('Error', 'Failed to get current location: $e');
      _loadWithDefaultLocation();
    }
  }

  void _loadWithDefaultLocation() {
    currentLocation.value = {
      'latitude': 28.6139,
      'longitude': 77.2090,
    };
    _loadNearbyGurudwaras();
  }

  Future<void> _loadNearbyGurudwaras() async {
    try {
      final location = currentLocation.value;
      if (location == null) return;

      final result = await getNearbyGurudwarasUseCase(
        latitude: location['latitude']!,
        longitude: location['longitude']!,
      );
      gurudwaras.assignAll(result);
      filteredGurudwaras.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load gurudwaras: $e');
    }
  }

  void _showLocationServiceDialog() {
    Get.dialog(
      LocationPermissionDialog(
        title: 'Location Service Disabled',
        message: 'Please enable location service to find nearby gurudwaras.',
        primaryButtonText: 'Enable Location',
        secondaryButtonText: 'Use Default Location',
        onPrimaryPressed: () async {
          Get.back();
          await locationService.openLocationSettings();
          await Future.delayed(const Duration(seconds: 1));
          checkLocationAndLoadData();
        },
        onSecondaryPressed: () {
          Get.back();
          _loadWithDefaultLocation();
        },
      ),
      barrierDismissible: false,
    );
  }

  void _showPermissionDialog() {
    Get.dialog(
      LocationPermissionDialog(
        title: 'Location Permission Required',
        message: 'Please grant location permission to find nearby gurudwaras.',
        primaryButtonText: 'Open Settings',
        secondaryButtonText: 'Use Default Location',
        onPrimaryPressed: () async {
          Get.back();
          await locationService.openAppSettings();
        },
        onSecondaryPressed: () {
          Get.back();
          _loadWithDefaultLocation();
        },
      ),
      barrierDismissible: false,
    );
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredGurudwaras.assignAll(gurudwaras);
    } else {
      filteredGurudwaras.assignAll(
        gurudwaras.where((gurudwara) =>
            gurudwara.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  void toggleFavorite(String gurudwaraId) {
    if (favorites.contains(gurudwaraId)) {
      favorites.remove(gurudwaraId);
    } else {
      favorites.add(gurudwaraId);
    }
  }

  bool isFavorite(String gurudwaraId) {
    return favorites.contains(gurudwaraId);
  }

  Future<void> refresh() async {
    await checkLocationAndLoadData();
  }
}
