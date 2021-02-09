import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/splash/splash_repository.dart';

class SplashController extends GetxController{
  final SplashRepository splashRepository;

  SplashController({@required this.splashRepository}): assert(splashRepository != null);
  @override 
  void onInit() async {
    super.onInit();
    await Future.delayed(Duration(seconds: 2));
    await splashRepository.checkIfIsLogged()
      ? Get.toNamed('/home')
      : Get.toNamed('/login');
  }
}