import '../../../home/domain/model/gurudwara_model.dart';

abstract class FavoriteServiceInterface {
  Future<List<GurudwaraModel>> getFavoriteGurudwaras(String userId);
  Future<void> addFavoriteGurudwara(String userId, String gurudwaraId);
  Future<void> removeFavoriteGurudwara(String userId, String gurudwaraId);
}