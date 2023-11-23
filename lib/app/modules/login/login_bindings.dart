import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/login/login_controller.dart';
import 'package:ponto_diario/app/repositories/login_repository.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(loginRepository: LoginRepository()),
    );
  }
}
