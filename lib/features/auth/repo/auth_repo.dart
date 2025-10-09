import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/networking/api_endpoints.dart';
import 'package:marketi/core/networking/api_service.dart';
import 'package:marketi/core/router/app_routes.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/core/utils/storage_keys.dart';
import 'package:marketi/core/utils/storage_manager.dart';
import 'package:marketi/features/auth/models/auth_response_model.dart';

class AuthRepo {
  Future<Either<String, AuthResponseModel>> login({
    required String userName,
    required String password,
  }) async {
    try {
      final Response response = await di<ApiService>().postRequest(
        endPoint: ApiEndPoints.login,
        data: {"username": userName, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponseModel authResponseModel = AuthResponseModel.fromJson(
          response.data,
        );
        if (authResponseModel.token != null &&
            authResponseModel.token!.isNotEmpty) {
          await di<StorageManager>().saveToken(value: authResponseModel.token!);
          return Right(authResponseModel);
        } else {
          return const Left('token not provided');
        }
      } else {
        return Left(response.toString());
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response.toString());
      }
      return Left(error.toString());
    }
  }

  logout(BuildContext context) async {
    await di<StorageManager>().removeToken(key: di<StorageKeys>().tokenKey);
    if (!context.mounted) return;
    GoRouter.of(context).go(AppRoutes.loginView);
  }
}
