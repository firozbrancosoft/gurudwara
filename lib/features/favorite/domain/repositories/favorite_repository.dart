import '../../../home/domain/model/gurudwara_model.dart';
import '../services/favorite_service_interface.dart';
import 'favorite_repository_interface.dart';

class FavoriteRepository implements FavoriteRepositoryInterface {
  final FavoriteServiceInterface favoriteService;

  FavoriteRepository(this.favoriteService);

  @override
  Future<List<GurudwaraModel>> getFavoriteGurudwaras(String userId) {
    return favoriteService.getFavoriteGurudwaras(userId);
  }

  @override
  Future<void> addFavoriteGurudwara(String userId, String gurudwaraId) {
    return favoriteService.addFavoriteGurudwara(userId, gurudwaraId);
  }

  @override
  Future<void> removeFavoriteGurudwara(String userId, String gurudwaraId) {
    return favoriteService.removeFavoriteGurudwara(userId, gurudwaraId);
  }
}
