import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/networking/api_service.dart';
import 'package:marketi/features/auth/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/repo/auth_repo.dart';

GetIt di = GetIt.instance;

setupServiceLocator() {
  Dio dio = Dio();
  di.registerLazySingleton<Dio>(() => dio);
  di.registerLazySingleton<AuthRepo>(() => AuthRepo());
  di.registerLazySingleton<ApiService>(() => ApiService());
  di.registerLazySingleton<AuthCubit>(() => AuthCubit(authRepo: di<AuthRepo>()));
}
