import '../repositories/favorite_repository_interface.dart';

class RemoveFavoriteGurudwaraUseCase {
  final FavoriteRepositoryInterface repository;

  RemoveFavoriteGurudwaraUseCase(this.repository);

  Future<void> call(String userId, String gurudwaraId) async {
    await repository.removeFavoriteGurudwara(userId, gurudwaraId);
  }
}