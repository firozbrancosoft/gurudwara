import '../../../home/domain/model/gurudwara_model.dart';

abstract class FavoriteRepositoryInterface {
  Future<List<GurudwaraModel>> getFavoriteGurudwaras(String userId);
  Future<void> addFavoriteGurudwara(String userId, String gurudwaraId);
  Future<void> removeFavoriteGurudwara(String userId, String gurudwaraId);
}