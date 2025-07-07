// lib/features/favorite/presentation/controllers/favorite_controller.dart
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../home/domain/model/gurudwara_model.dart';
import '../domain/usecases/add_favorite_gurudwara_usecase.dart';
import '../domain/usecases/get_favorite_gurudwaras_usecase.dart';
import '../domain/usecases/remove_favorite_gurudwara_usecase.dart';

class FavoriteController extends GetxController {
  late GetFavoriteGurudwarasUseCase getFavoriteGurudwarasUseCase;
  late AddFavoriteGurudwaraUseCase addFavoriteGurudwaraUseCase;
  late RemoveFavoriteGurudwaraUseCase removeFavoriteGurudwaraUseCase;

  final RxList<GurudwaraModel> favoriteGurudwaras = <GurudwaraModel>[].obs;
  final RxBool isLoading = true.obs;
  late int userId; // This should be set to the actual user ID


  @override
  void onInit() {
    super.onInit();
    // userId = Get.find<AuthController>().currentUser.value!.id;
    userId = 2;
    getFavoriteGurudwarasUseCase =Get.find<GetFavoriteGurudwarasUseCase>();
    addFavoriteGurudwaraUseCase =Get.find<AddFavoriteGurudwaraUseCase>();
    removeFavoriteGurudwaraUseCase = Get.find<RemoveFavoriteGurudwaraUseCase>();
    fetchFavoriteGurudwaras("$userId");
  }

  Future<void> fetchFavoriteGurudwaras(String userId) async {
    try {
      isLoading.value = true;
      final gurudwaras = await getFavoriteGurudwarasUseCase(userId);
      favoriteGurudwaras.assignAll(gurudwaras);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch favorite Gurudwaras: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleFavorite(String gurudwaraId) async {
    try {
      final isCurrentlyFavorite = favoriteGurudwaras.any((g) => g.id == gurudwaraId);
      if (isCurrentlyFavorite) {
        await removeFavoriteGurudwaraUseCase("$userId", gurudwaraId);
      } else {
        await addFavoriteGurudwaraUseCase("$userId", gurudwaraId);
      }
      await fetchFavoriteGurudwaras("$userId"); // Refresh the list after toggling
    } catch (e) {
      Get.snackbar('Error', 'Failed to update favorites: $e');
    }
  }

  Future<void> refresh() async {
    await fetchFavoriteGurudwaras("$userId");
  }
}
