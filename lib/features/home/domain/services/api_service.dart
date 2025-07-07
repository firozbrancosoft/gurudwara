import '../../../../core/services/network/api_client.dart';
import '../model/gurudwara_model.dart';
import 'api_service_interface.dart';

class ApiService implements ApiServiceInterface {
  final ApiClient _apiClient;

  ApiService(this._apiClient);

  @override
  Future<List<GurudwaraModel>> getNearbyGurudwaras({
    required double latitude,
    required double longitude,
  }) async {
    try {
      // API call (commented out for dummy data)
      // final response = await _apiClient.get(
      //   AppConstants.nearbyGurudwarasUrl,
      //   queryParams: {
      //     'latitude': latitude.toString(),
      //     'longitude': longitude.toString(),
      //     'radius': '10',
      //   },
      // );

      // Dummy JSON response
      final response = {
        'status': 'success',
        'data': [
          {
            'id': '1',
            'name': 'Gurudwara Shri Nanak Piao Sahib',
            'address': 'GT Karnal Rd, Rana Pratap Bagh, New Delhi, Delhi 110007',
            'imageUrl': 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=400',
            'distance': '2.8',
            'latitude': '28.6861',
            'longitude': '77.1921',
            'is_favorite': '1',
          },
          {
            'id': '2',
            'name': 'Gurudwara Damdama Sahib',
            'address': 'Mehrauli-Gurgaon Rd, Sector 29, Gurugram, Haryana 122002',
            'imageUrl': 'https://images.unsplash.com/photo-1590736969955-71cc94901144?w=400',
            'distance': '5.4',
            'latitude': '28.4595',
            'longitude': '77.0266',
            'is_favorite': '0',
          },
          {
            'id': '3',
            'name': 'Gurudwara Moti Bagh Sahib',
            'address': 'Ring Rd, Near Dhaula Kuan, New Delhi, Delhi 110021',
            'imageUrl': 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
            'distance': '3.2',
            'latitude': '28.5822',
            'longitude': '77.1834',
            'is_favorite': '1',
          },
        ]
      };

      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

      final List<dynamic> data = response['data'] as List<dynamic>;
      return data.map((json) => GurudwaraModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch nearby gurudwaras: $e');
    }
  }

  @override
  Future<List<GurudwaraModel>> searchGurudwaras(String query, {
    required double latitude,
    required double longitude,
  }) async {
    try {
      // API call (commented out for dummy data)
      // final response = await _apiClient.post(
      //   AppConstants.searchGurudwarasUrl,
      //   data: {
      //     'query': query,
      //     'latitude': latitude.toString(),
      //     'longitude': longitude.toString(),
      //   },
      // );

      // Dummy JSON response
      final response = {
        'status': 'success',
        'data': [
          {
            'id': '4',
            'name': 'Gurudwara Bala Sahib',
            'address': 'Sarojini Nagar, New Delhi, Delhi 110023',
            'imageUrl': 'https://images.unsplash.com/photo-1590736969955-71cc94901144?w=400',
            'distance': '4.0',
            'latitude': '28.5712',
            'longitude': '77.1991',
            'is_favorite': '0',
          },
          {
            'id': '5',
            'name': 'Gurudwara Bangla Sahib',
            'address': 'Hanuman Road Area, Connaught Place, New Delhi, Delhi 110001',
            'imageUrl': 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=400',
            'distance': '2.5',
            'latitude': '28.6304',
            'longitude': '77.2177',
            'is_favorite': '1',
          },
        ]
      };

      await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay

      final List<dynamic> data = response['data'] as List<dynamic>;
      return data
          .map((json) => GurudwaraModel.fromJson(json))
          .where((gurudwara) => gurudwara.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } catch (e) {
      throw Exception('Failed to search gurudwaras: $e');
    }
  }
}
