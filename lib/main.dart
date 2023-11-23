import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ponto_diario/app/modules/splash/splash_controller.dart';
import 'package:ponto_diario/app/modules/splash/splash_page.dart';
import 'package:ponto_diario/locator.dart';

void main() async {
  await GetStorage.init();
  setupLocator();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ponto diário!",
      color: Colors.green,
      home: BlocProvider.value(
        value: getIt<SplashController>(),
        child: SplashPage(),
      ),
    ),
  );
}
