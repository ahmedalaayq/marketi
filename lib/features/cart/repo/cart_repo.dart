import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/networking/api_endpoints.dart';
import 'package:marketi/core/networking/api_service.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/features/cart/models/cart_model.dart';
import 'package:marketi/features/home/models/product_model.dart';

class CartRepo {
  final ApiService apiService;

  const CartRepo({required this.apiService});
  Future<Either<String, CartModel>> getUserCart() async {
    try {
      final Response response = await di<ApiService>().getRequest(
        endPoint: "${ApiEndPoints.carts}/3",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        CartModel cart = CartModel.fromJson(response.data);
        return Right(cart);
      } else {
        return const Left('error in fetching cart');
      }
    } catch (e) {
      if (e is DioException) {
        return Left(e.response?.data ?? "an error occurred");
      } else {
        return Left(e.toString());
      }
    }
  }

  Future<Either<String, CartModel>> addToCart({
    required String date,
    required ProductModel product,
    required int quantity,
  }) async {
    try {
      final Response response = await di<ApiService>().putRequest(
        endPoint: "${ApiEndPoints.carts}/3",
        data: {
          "id": 3,
          "userId": 3,
          "date": date,
          "products": [
            {"productId": product.id, "quantity": quantity},
          ],
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        CartModel cart = CartModel.fromJson(response.data);
        return Right(cart);
      } else {
        return const Left('error on adding to cart');
      }
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(e.response?.data.toString() ?? 'an error occurred at position $stackTrace');
      } else {
        return Left(e.toString());
      }
    }
  }
}