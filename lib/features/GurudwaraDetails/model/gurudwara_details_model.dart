class GurudwaraDetailsModel {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final double distance;
  final double latitude;
  final double longitude;
  final String? isFavorite;
  final List<String> images;
  final String description;
  final String timing;
  final String contact;

  GurudwaraDetailsModel({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.isFavorite,
    required this.images,
    required this.description,
    required this.timing,
    required this.contact,
  });

  factory GurudwaraDetailsModel.fromJson(Map<String, dynamic> json) {
    return GurudwaraDetailsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      distance: double.tryParse(json['distance'].toString()) ?? 0.0,
      latitude: double.tryParse(json['latitude'].toString()) ?? 0.0,
      longitude: double.tryParse(json['longitude'].toString()) ?? 0.0,
      isFavorite: json['is_favorite'] as String?,
      images: List<String>.from(json['images'] ?? []),
      description: json['description'] ?? '',
      timing: json['timing'] ?? '',
      contact: json['contact'] ?? '',
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
      'images': images,
      'description': description,
      'timing': timing,
      'contact': contact,
    };
  }
}