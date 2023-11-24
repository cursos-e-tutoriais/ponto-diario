import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ponto_diario/app/core/utils.dart';
import 'package:ponto_diario/app/modules/home/home_controller.dart';
import 'package:ponto_diario/app/modules/login/login_controller.dart';
import 'package:ponto_diario/app/modules/settings/settings_controller.dart';
import 'package:ponto_diario/app/modules/splash/splash_controller.dart';
import 'package:ponto_diario/app/repositories/home_repository.dart';
import 'package:ponto_diario/app/repositories/login_repository.dart';
import 'package:ponto_diario/app/repositories/settings_repository.dart';
import 'package:ponto_diario/app/repositories/splash_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerFactory<Dio>(() => Dio(
        BaseOptions(
          baseUrl: Utils.urlBase,
          connectTimeout: Duration(seconds: 5),
        ),
      ));

  getIt.registerLazySingleton<SplashRepository>(
      () => SplashRepository(getIt<Dio>()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerLazySingleton<SettingsRepository>(
      () => SettingsRepository(getIt()));

  getIt.registerLazySingleton<SplashController>(
      () => SplashController(splashRepository: getIt()));
  getIt.registerLazySingleton<LoginController>(
      () => LoginController(loginRepository: getIt()));
  getIt.registerLazySingleton<HomeController>(
      () => HomeController(homeRepository: getIt()));
  getIt.registerLazySingleton<SettingsController>(
      () => SettingsController(settingsRepository: getIt()));
}
