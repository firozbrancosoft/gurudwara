

import '../../../../core/services/network/api_client.dart';
import '../../model/gurudwara_details_model.dart';
import '../../model/reward_model.dart';
import 'gurudwara_details_api_service_interface.dart';

class GurudwaraDetailsApiService implements GurudwaraDetailsApiServiceInterface {
  // final ApiClient _apiClient;

  // GurudwaraDetailsApiService(this._apiClient);

  @override
  Future<GurudwaraDetailsModel?> fetchGurudwaraDetails(String id) async {
    try {
      // API call (commented out for dummy data)
      // final response = await _apiClient.get(
      //   '${AppConstants.gurudwaraDetailsUrl}/$id',
      // );

      // Dummy JSON data
      final dummyResponse = {
        'id': id,
        'name': 'Bangla Sahib Gurudwara',
        'address': 'Hanuman Road Area, Connaught Place, New Delhi, Delhi 110001',
        'imageUrl': 'https://example.com/bangla_sahib.jpg',
        'distance': 4.1,
        'latitude': 28.6264,
        'longitude': 77.2080,
        'is_favorite': 'false',
        'images': [
          'https://example.com/bangla_sahib1.jpg',
          'https://example.com/bangla_sahib2.jpg',
          'https://example.com/bangla_sahib3.jpg',
        ],
        'description': 'Gurudwara Bangla Sahib is one of the most prominent Sikh gurdwaras in Delhi, India. It was originally a bungalow belonging to Raja Jai Singh, a Rajput ruler of Amber, after whom Jaisinghpura area is named.',
        'timing': '4:00 AM - 10:00 PM',
        'contact': '+91-11-23365358',
      };

      return GurudwaraDetailsModel.fromJson(dummyResponse);
    } catch (e) {
      print('Error fetching gurudwara details: $e');
      return null;
    }
  }

  @override
  Future<List<RewardModel>> fetchRewards() async {
    try {
      // API call (commented out for dummy data)
      // final response = await _apiClient.get(
      //   AppConstants.rewardsUrl,
      // );

      // Dummy JSON data
      final dummyResponse = [
        {
          'id': '1',
          'name': 'Laptop',
          'imageUrl': 'https://example.com/laptop.jpg',
          'points': 2000,
          'category': 'Electronics',
        },
        {
          'id': '2',
          'name': 'Cycle',
          'imageUrl': 'https://example.com/cycle.jpg',
          'points': 2000,
          'category': 'Sports',
        },
        {
          'id': '3',
          'name': 'Tablet',
          'imageUrl': 'https://example.com/tablet.jpg',
          'points': 3000,
          'category': 'Electronics',
        },
        {
          'id': '4',
          'name': 'Bag',
          'imageUrl': 'https://example.com/bag.jpg',
          'points': 1000,
          'category': 'Accessories',
        },
      ];

      return dummyResponse.map((json) => RewardModel.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching rewards: $e');
      return [];
    }
  }
}