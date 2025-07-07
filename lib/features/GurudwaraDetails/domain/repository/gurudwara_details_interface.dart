import '../../model/gurudwara_details_model.dart';
import '../../model/reward_model.dart';


abstract class GurudwaraDetailsInterface {
  Future<GurudwaraDetailsModel?> getGurudwaraDetails(String id);
  Future<List<RewardModel>> getRewards();
}
