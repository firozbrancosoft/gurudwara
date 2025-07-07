import '../../../home/domain/model/gurudwara_model.dart';
import '../repositories/favorite_repository_interface.dart';

class GetFavoriteGurudwarasUseCase {
  final FavoriteRepositoryInterface repository;

  GetFavoriteGurudwarasUseCase(this.repository);

  Future<List<GurudwaraModel>> call(String userId) async {
    return await repository.getFavoriteGurudwaras(userId);
  }
}