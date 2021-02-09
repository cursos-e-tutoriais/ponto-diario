import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/splash/splash_repository.dart';

class SplashController extends GetxController{
  final SplashRepository splashRepository;

  SplashController({@required this.splashRepository});

  checkIfIsLogged() async {
    await Future.delayed(Duration(seconds: 2));
    await splashRepository.checkIfIsLogged()
      ? Get.offAllNamed('/home')
      : Get.offAllNamed('/login');
  }
  @override 
  void onInit() async {
    checkIfIsLogged();
    super.onInit();
  }
}