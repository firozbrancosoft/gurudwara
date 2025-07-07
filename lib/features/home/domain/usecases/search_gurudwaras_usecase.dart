import '../model/gurudwara_model.dart';
import '../repositories/gurudwara_repository_interface.dart';

class SearchGurudwarasUseCase {
  final GurudwaraRepositoryInterface repository;

  SearchGurudwarasUseCase(this.repository);

  Future<List<GurudwaraModel>> call(String query, {
    required double latitude,
    required double longitude,
  }) async {
    return await repository.searchGurudwaras(
      query,
      latitude: latitude,
      longitude: longitude,
    );
  }
}