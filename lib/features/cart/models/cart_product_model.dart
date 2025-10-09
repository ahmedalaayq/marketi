class CartProductModel {
  const CartProductModel({required this.productId, required this.quantity});
  final int productId;
  final int quantity;

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}

