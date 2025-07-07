class RewardModel {
  final String id;
  final String name;
  final String imageUrl;
  final int points;
  final String category;

  RewardModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.points,
    required this.category,
  });

  factory RewardModel.fromJson(Map<String, dynamic> json) {
    return RewardModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      points: json['points'] ?? 0,
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'points': points,
      'category': category,
    };
  }
}