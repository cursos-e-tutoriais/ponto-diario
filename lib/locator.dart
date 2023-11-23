import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ponto_diario/app/modules/splash/splash_controller.dart';
import 'package:ponto_diario/app/repositories/splash_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerFactory<Dio>(
      () => Dio(BaseOptions(connectTimeout: Duration(seconds: 5))));

  getIt.registerLazySingleton<SplashRepository>(
      () => SplashRepository(getIt<Dio>()));

  getIt.registerLazySingleton<SplashController>(
      () => SplashController(splashRepository: getIt()));
}
