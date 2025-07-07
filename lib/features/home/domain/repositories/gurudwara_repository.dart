import '../model/gurudwara_model.dart';
import '../services/api_service_interface.dart';
import 'gurudwara_repository_interface.dart';

class GurudwaraRepository implements GurudwaraRepositoryInterface {
  final ApiServiceInterface apiService;

  GurudwaraRepository(this.apiService);

  @override
  Future<List<GurudwaraModel>> getNearbyGurudwaras({
    required double latitude,
    required double longitude,
  }) async {
    return await apiService.getNearbyGurudwaras(
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  Future<List<GurudwaraModel>> searchGurudwaras(String query, {
    required double latitude,
    required double longitude,
  }) async {
    return await apiService.searchGurudwaras(
      query,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
