import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/networking/api_endpoints.dart';
import 'package:marketi/core/networking/api_service.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/features/home/models/category_model.dart';
import 'package:marketi/features/home/models/product_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo({required this.apiService});
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    try {
      final Response response = await di<ApiService>().getRequest(
        endPoint: ApiEndPoints.products,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> dataList = response.data as List<dynamic>;
        final List<ProductModel> products =
            dataList
                .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
                .toList();
        return Right(products);
      } else {
        log(response.data.toString());
        return const Left('An error occurred');
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response?.data.toString() ?? error.message!);
      }
      return Left(error.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> getAllCategories() async {
    try {
      final Response response = await di<ApiService>().getRequest(
        endPoint: ApiEndPoints.categories,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> dataList = response.data as List<dynamic>;
        final List<CategoryModel> categories =
            dataList.map((e) => CategoryModel.fromJson(e as String)).toList();
        return Right(categories);
      } else {
        log(response.data.toString());
        return const Left('An error occurred');
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response?.data.toString() ?? error.message!);
      }
      return Left(error.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> getProductsByCategory(
    String categoryName,
  ) async {
    try {
      final Response response = await di<ApiService>().getRequest(
        //? https://fakestoreapi.com/products/category/:category_name
        endPoint: "/products/category/$categoryName",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> dataList = response.data as List<dynamic>;
        final List<ProductModel> products =
            dataList
                .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
                .toList();
        return Right(products);
      } else {
        log(response.data.toString());
        return const Left('An error occurred');
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response?.data.toString() ?? error.message!);
      }
      return Left(error.toString());
    }
  }
}
