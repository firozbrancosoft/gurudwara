import '../../model/gurudwara_details_model.dart';
import '../../model/reward_model.dart';

abstract class GurudwaraDetailsApiServiceInterface {
  Future<GurudwaraDetailsModel?> fetchGurudwaraDetails(String id);
  Future<List<RewardModel>> fetchRewards();
}