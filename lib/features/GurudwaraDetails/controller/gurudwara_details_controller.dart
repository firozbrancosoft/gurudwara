import 'package:get/get.dart';
import '../domain/usecase/gurudwara_details_usecase.dart';
import '../model/gurudwara_details_model.dart';
import '../model/reward_model.dart';

class GurudwaraDetailsController extends GetxController {
  final GurudwaraDetailsUseCase _useCase;

  GurudwaraDetailsController(this._useCase);

  final Rx<GurudwaraDetailsModel?> gurudwaraDetails = Rx<GurudwaraDetailsModel?>(null);
  final RxList<RewardModel> rewards = <RewardModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isRewardsLoading = false.obs;
  final RxString error = ''.obs;
  final RxInt currentImageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final String? gurudwaraId = Get.arguments?['id'];
    if (gurudwaraId != null) {
      fetchGurudwaraDetails(gurudwaraId);
    }
    fetchRewards();
  }

  Future<void> fetchGurudwaraDetails(String id) async {
    try {
      isLoading.value = true;
      error.value = '';

      final result = await _useCase.getGurudwaraDetails(id);
      gurudwaraDetails.value = result;

      if (result == null) {
        error.value = 'Failed to load gurudwara details';
      }
    } catch (e) {
      error.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchRewards() async {
    try {
      isRewardsLoading.value = true;
      final result = await _useCase.getRewards();
      rewards.value = result;
    } catch (e) {
      print('Error fetching rewards: $e');
    } finally {
      isRewardsLoading.value = false;
    }
  }

  void updateImageIndex(int index) {
    currentImageIndex.value = index;
  }

  void toggleFavorite() {
    if (gurudwaraDetails.value != null) {
      final current = gurudwaraDetails.value!;
      final newFavoriteStatus = current.isFavorite == 'true' ? 'false' : 'true';

      gurudwaraDetails.value = GurudwaraDetailsModel(
        id: current.id,
        name: current.name,
        address: current.address,
        imageUrl: current.imageUrl,
        distance: current.distance,
        latitude: current.latitude,
        longitude: current.longitude,
        isFavorite: newFavoriteStatus,
        images: current.images,
        description: current.description,
        timing: current.timing,
        contact: current.contact,
      );
    }
  }
}