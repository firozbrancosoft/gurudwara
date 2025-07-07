import '../model/gurudwara_model.dart';

abstract class GurudwaraRepositoryInterface {
  Future<List<GurudwaraModel>> getNearbyGurudwaras({
    required double latitude,
    required double longitude,
  });
  Future<List<GurudwaraModel>> searchGurudwaras(String query, {
    required double latitude,
    required double longitude,
  });
}