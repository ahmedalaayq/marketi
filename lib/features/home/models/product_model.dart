import 'rating_model.dart';

class ProductModel {
  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] ?? "",
      price: json['price'] ?? 0.0,
      description: json['description'] ?? "",
      category: json['category'] ?? "",
      image: json['image'] ?? "",
      rating: RatingModel.fromJson(json['rating'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating,
    };
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, "description: $description, image: $image, rating: $rating)';
  }
}
