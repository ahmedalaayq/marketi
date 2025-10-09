import 'package:marketi/features/cart/models/cart_product_model.dart';

class CartModel {
  const CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  final int id;
  final int userId;
  final DateTime date;
  final List<CartProductModel> products;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      products:
          List.from(
            json['products'] ?? [],
          ).map((e) => CartProductModel.fromJson(json)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'products': products.map((p) => p.toJson()).toList(),
    };
  }
}
