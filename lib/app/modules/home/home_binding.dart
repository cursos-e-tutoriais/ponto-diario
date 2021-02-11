import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/home/home_controller.dart';
import 'package:ponto_diario/app/repositories/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(homeRepository:  HomeRepository()),
    );
  }
}
