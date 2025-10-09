import 'package:marketi/features/cart/models/cart_model.dart';

abstract class CartState {}

class GetCartInitialState extends CartState {}

class GetCartLoadingState extends CartState {}

class GetCartSuccessState extends CartState {
  GetCartSuccessState({required this.cart});
  final CartModel cart;
}

class GetCartFailureState extends CartState {
  GetCartFailureState({required this.errorMessage});
  final String errorMessage;
}

class AddingToCart extends CartState {}

class AddingToCartLoadingState extends CartState {}

class AddingToCartSuccessState extends CartState {
  AddingToCartSuccessState({required this.cart});
  final CartModel cart;
}

class AddingToCartFailureState extends CartState {
  AddingToCartFailureState({required this.errorMessage});
  final String errorMessage;
}
