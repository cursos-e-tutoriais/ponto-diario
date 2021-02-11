import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/splash/splash_controller.dart';
import 'package:ponto_diario/app/repositories/splash_repository.dart';

class SplashBindings implements Bindings {
  @override 
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(splashRepository: SplashRepository()));
  }
}