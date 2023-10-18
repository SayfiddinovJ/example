import 'package:example/data/models/ranking_model.dart';

class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel ranking;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ranking,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      price: json["price"] as num? ?? 0,
      description: json["description"] as String? ?? "",
      category: json["category"] as String? ?? '',
      image: json["image"] as String? ?? "",
      ranking: RatingModel.fromJson(json["rating"]),
    );
  }
}
