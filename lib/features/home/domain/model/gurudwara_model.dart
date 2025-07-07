class GurudwaraModel {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final double distance;
  final double latitude;
  final double longitude;
  final String? isFavorite;

  GurudwaraModel({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.isFavorite,
  });

  factory GurudwaraModel.fromJson(Map<String, dynamic> json) {
    return GurudwaraModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      distance: double.tryParse(json['distance'].toString()) ?? 0.0,
      latitude: double.tryParse(json['latitude'].toString()) ?? 0.0,
      longitude: double.tryParse(json['longitude'].toString()) ?? 0.0,
      isFavorite: json['is_favorite'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'imageUrl': imageUrl,
      'distance': distance.toString(),
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'is_favorite': isFavorite,
    };
  }
}
