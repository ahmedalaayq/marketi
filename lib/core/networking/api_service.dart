import 'package:dio/dio.dart';
import 'package:marketi/core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static Dio? _dio;

  ApiService() {
    _dio ??= Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
    _dio!.interceptors.add(PrettyDioLogger());
  }

  Future<dynamic> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParamters,
  }) async {
    try {
      final Response response = await _dio!.get(
        endPoint,
        queryParameters: {
          ...queryParamters ?? {"Content-Type": 'application/json'},
        },
      );
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response response = await _dio!.post(
        endPoint,
        data: {"Content-Type": 'application/json', ...data ?? {}},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response response = await _dio!.put(
        endPoint,
        data: {"Content-Type": 'application/json', ...data ?? {}},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
