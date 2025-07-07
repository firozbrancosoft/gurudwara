

import '../../model/gurudwara_details_model.dart';
import '../../model/reward_model.dart';
import '../repository/gurudwara_details_interface.dart';
import '../repository/gurudwara_details_repository.dart';

class GurudwaraDetailsUseCase {
  final GurudwaraDetailsRepository _repository;

  GurudwaraDetailsUseCase(this._repository);

  Future<GurudwaraDetailsModel?> getGurudwaraDetails(String id) async {
    return await _repository.getGurudwaraDetails(id);
  }

  Future<List<RewardModel>> getRewards() async {
    return await _repository.getRewards();
  }
}