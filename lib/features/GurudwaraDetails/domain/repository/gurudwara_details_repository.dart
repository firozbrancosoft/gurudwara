

import '../../model/gurudwara_details_model.dart';
import '../../model/reward_model.dart';
import '../service/gurudwara_details_api_service.dart';
import '../service/gurudwara_details_api_service_interface.dart';
import 'gurudwara_details_interface.dart';

class GurudwaraDetailsRepository implements GurudwaraDetailsInterface {
  final GurudwaraDetailsApiService _apiService;

  GurudwaraDetailsRepository(this._apiService);

  @override
  Future<GurudwaraDetailsModel?> getGurudwaraDetails(String id) async {
    return await _apiService.fetchGurudwaraDetails(id);
  }

  @override
  Future<List<RewardModel>> getRewards() async {
    return await _apiService.fetchRewards();
  }
}

