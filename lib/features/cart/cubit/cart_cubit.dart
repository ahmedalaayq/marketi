import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/networking/api_service.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/features/cart/cubit/cart_state.dart';
import 'package:marketi/features/cart/repo/cart_repo.dart';
import 'package:marketi/features/home/models/product_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(GetCartInitialState());
  final CartRepo cartRepo;

  addToCart({
    required String date,
    required int quantity,
    required ProductModel product,
  }) async {
    emit(AddingToCartLoadingState());
    final Either response = await CartRepo(
      apiService: di<ApiService>(),
    ).addToCart(date: date, product: product, quantity: quantity);

    response.fold(
      (error) {
        emit(AddingToCartFailureState(errorMessage: error));
      },
      (data) {
        emit(AddingToCartSuccessState(cart: data));
      },
    );
  }

  getCart() async {
    emit(GetCartLoadingState());
    final Either response = await cartRepo.getUserCart();
    response.fold(
      (error) {
        emit(GetCartFailureState(errorMessage: error));
      },
      (data) {
        emit(GetCartSuccessState(cart: data));
      },
    );
  }
}
