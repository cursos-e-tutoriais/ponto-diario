import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/login/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLogged;
  LoginController({@required this.loginRepository}): assert(loginRepository != null);
  @override 
  void onInit() {
    super.onInit();
  }

  Future<bool> login(email, pass) async {
    isLogged = await loginRepository.login(email, pass);
    if (isLogged == true) {
      Get.offNamed('/home');
    }
    return isLogged;
  }
}