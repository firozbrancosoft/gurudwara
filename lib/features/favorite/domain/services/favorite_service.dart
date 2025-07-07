import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/network/api_client.dart';
import '../../../home/domain/model/gurudwara_model.dart';
import 'favorite_service_interface.dart';

class FavoriteService implements FavoriteServiceInterface {
  final ApiClient _apiClient;

  FavoriteService(this._apiClient);

  @override
  Future<List<GurudwaraModel>> getFavoriteGurudwaras(String userId) async {
    try {
      // Dummy response instead of API call
      // final response = await _apiClient.post(
      //   AppConstants.getFavoritesUrl,
      //   data: {'userId': userId},
      // );

      // Dummy Data (distance, latitude, longitude as string)
      final response = {
        'status': 'success',
        'data': [
          {
            'id': '1',
            'name': 'Bangla Sahib Gurudwara',
            'address':
            'Hanuman Road Area, Connaught Place, New Delhi, Delhi 110001',
            'imageUrl':
            'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=400',
            'distance': '4.1',
            'latitude': '28.6304',
            'longitude': '77.2177',
            'is_favorite': '1',
          },
          {
            'id': '2',
            'name': 'Gurudwara Sis Ganj Sahib',
            'address':
            'M64M+92V, Chandni Chowk Rd, Maliwara, Chatta Pratap, Chandni Chowk, New Delhi, Delhi, 110006',
            'imageUrl':
            'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=400',
            'distance': '4.1',
            'latitude': '28.6562',
            'longitude': '77.2410',
            'is_favorite': '1',
          },
          {
            'id': '3',
            'name': 'Gurudwara Sis Ganj Sahib',
            'address':
            'M64M+92V, Chandni Chowk Rd, Maliwara, Chatta Pratap, Chandni Chowk, New Delhi, Delhi, 110006',
            'imageUrl':
            'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=400',
            'distance': '4.1',
            'latitude': '28.6562',
            'longitude': '77.2410',
            'is_favorite': '1',
          },
        ]
      };

      final List data = response['data'] as List;
      return data.map((json) => GurudwaraModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch favorite gurudwaras: $e');
    }
  }

  @override
  Future<void> addFavoriteGurudwara(String userId, String gurudwaraId) async {
    try {
      // Dummy response instead of API call
      // await _apiClient.post(
      //   AppConstants.addFavoriteUrl,
      //   data: {
      //     'userId': userId,
      //     'gurudwaraId': gurudwaraId,
      //   },
      // );
    } catch (e) {
      throw Exception('Failed to add favorite Gurudwara: $e');
    }
  }

  @override
  Future<void> removeFavoriteGurudwara(String userId, String gurudwaraId) async {
    try {
      // Dummy response instead of API call
      // await _apiClient.post(
      //   AppConstants.removeFavoriteUrl,
      //   data: {
      //     'userId': userId,
      //     'gurudwaraId': gurudwaraId,
      //   },
      // );
    } catch (e) {
      throw Exception('Failed to remove favorite Gurudwara: $e');
    }
  }
}
