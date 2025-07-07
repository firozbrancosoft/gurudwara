import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gurudwara/features/favorite/domain/repositories/favorite_repository_interface.dart';
import 'package:gurudwara/features/intro/controllers/intro_controller.dart';
import 'package:gurudwara/features/profile/controller/profile_controller.dart';
import '../../features/favorite/controller/favorite_controller.dart';
import '../../features/favorite/domain/repositories/favorite_repository.dart';
import '../../features/favorite/domain/services/favorite_service.dart';
import '../../features/favorite/domain/usecases/add_favorite_gurudwara_usecase.dart';
import '../../features/favorite/domain/usecases/get_favorite_gurudwaras_usecase.dart';
import '../../features/favorite/domain/usecases/remove_favorite_gurudwara_usecase.dart';
import '../../features/home/controller/home_controller.dart';
import '../../features/home/domain/repositories/gurudwara_repository.dart';
import '../../features/home/domain/services/api_service.dart';
import '../../features/home/domain/services/location_service.dart';
import '../../features/home/domain/services/location_service_interface.dart';
import '../../features/home/domain/usecases/get_nearby_gurudwaras_usecase.dart';
import '../../features/home/domain/usecases/search_gurudwaras_usecase.dart';
import '../services/network/api_client.dart';
import '../services/network/network_info.dart';
import 'package:dio/dio.dart';
import '../../features/auth/controllers/auth_controller.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/services/auth_service.dart';
import '../../features/splash/controllers/splash_controller.dart';
import '../../features/splash/domain/repositories/splash_repository.dart';
import '../../features/splash/domain/services/splash_service.dart';
import '../theme/theme_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Core services
    Get.lazyPut(() => Dio(), fenix: true);
    Get.lazyPut(() => ApiClient(), fenix: true);
    Get.lazyPut(() => Connectivity(), fenix: true);
    Get.lazyPut(() => NetworkInfo(Get.find<Connectivity>()), fenix: true);

    // Splash
    Get.lazyPut(() => SplashRepository(Get.find<ApiClient>()), fenix: true);
    Get.lazyPut(() => SplashService(Get.find<SplashRepository>()), fenix: true);
    Get.lazyPut(() => SplashController(Get.find<SplashService>()), fenix: true);

    // Intro
    // Get.lazyPut(() => IntroController(Get.find<SplashService>()), fenix: true);
    Get.lazyPut(() => IntroController(), fenix: true);


    // Auth
    Get.lazyPut(() => AuthRepository(Get.find<ApiClient>()), fenix: true);
    Get.lazyPut(() => AuthService(Get.find<AuthRepository>()), fenix: true);
    Get.lazyPut(() => AuthController(Get.find<AuthService>()), fenix: true);


    // Home
    Get.lazyPut(() => ApiService(Get.find<ApiClient>()), fenix: true);
    Get.lazyPut(() => GurudwaraRepository(Get.find<ApiService>()), fenix: true);
    Get.lazyPut(() => GetNearbyGurudwarasUseCase(Get.find<GurudwaraRepository>()), fenix: true);
    Get.lazyPut(() => SearchGurudwarasUseCase(Get.find<GurudwaraRepository>()), fenix: true);
    Get.lazyPut<LocationServiceInterface>(() => LocationService(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);


    // Favorite
    Get.lazyPut(() => FavoriteService(Get.find<ApiClient>()), fenix: true);
    Get.lazyPut(() => FavoriteRepository(Get.find<FavoriteService>()), fenix: true);
    Get.lazyPut(() => GetFavoriteGurudwarasUseCase(Get.find<FavoriteRepository>()), fenix: true);
    Get.lazyPut(() => AddFavoriteGurudwaraUseCase(Get.find<FavoriteRepository>() ), fenix: true);
    Get.lazyPut(() => RemoveFavoriteGurudwaraUseCase(Get.find<FavoriteRepository>() ), fenix: true);
    Get.lazyPut(() => FavoriteController(), fenix: true);

    // Profile

    Get.lazyPut(() => ProfileController(), fenix: true);

  }
}