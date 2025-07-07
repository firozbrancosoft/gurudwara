import '../model/gurudwara_model.dart';
import '../repositories/gurudwara_repository_interface.dart';

class GetNearbyGurudwarasUseCase {
  final GurudwaraRepositoryInterface repository;

  GetNearbyGurudwarasUseCase(this.repository);

  Future<List<GurudwaraModel>> call({
    required double latitude,
    required double longitude,
  }) async {
    return await repository.getNearbyGurudwaras(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
