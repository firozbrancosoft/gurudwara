import '../repositories/favorite_repository_interface.dart';

class AddFavoriteGurudwaraUseCase {
  final FavoriteRepositoryInterface repository;

  AddFavoriteGurudwaraUseCase(this.repository);

  Future<void> call(String userId, String gurudwaraId) async {
    await repository.addFavoriteGurudwara(userId, gurudwaraId);
  }
}