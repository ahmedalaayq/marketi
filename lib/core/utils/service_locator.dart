import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/networking/api_service.dart';
import 'package:marketi/core/utils/storage_keys.dart';
import 'package:marketi/core/utils/storage_manager.dart';
import 'package:marketi/features/auth/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/repo/auth_repo.dart';
import 'package:marketi/features/home/cubits/home_categories_cubit.dart';
import 'package:marketi/features/home/cubits/home_product_cubit.dart';
import 'package:marketi/features/home/repo/home_repo.dart';

GetIt di = GetIt.instance;

setupServiceLocator() {
  Dio dio = Dio();
  // Dio Object
  di.registerLazySingleton<Dio>(() => dio);
  // Auth Repo
  di.registerLazySingleton<AuthRepo>(() => AuthRepo());
  // Home Repo
  di.registerLazySingleton<HomeRepo>(() => HomeRepo(apiService: di<ApiService>()));
  // Api Service
  di.registerLazySingleton<ApiService>(() => ApiService());
  // Auth Cubit
  di.registerLazySingleton<AuthCubit>(
    () => AuthCubit(authRepo: di<AuthRepo>()),
  );
  // Home Product Cubit
  di.registerLazySingleton<HomeProductCubit>(
    () => HomeProductCubit(homeRepo: di<HomeRepo>()),
  );
  // Home Category Cubit
  di.registerLazySingleton<HomeCategoryCubit>(
    () => HomeCategoryCubit(homeRepo: di<HomeRepo>()),
  );
  // Storage Manager
  di.registerLazySingleton(() => StorageManager());

  // Storage Keys
  di.registerLazySingleton(() => StorageKeys());
}
