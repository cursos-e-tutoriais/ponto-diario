import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: GetBuilder<SplashController>(
        builder: (_) {
          return Center(
            child: Text(
              'Ponto Diário',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.07,
              ),
            ),
          );
        },
      ),
    );
  }
}
