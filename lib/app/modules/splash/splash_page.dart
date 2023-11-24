import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ponto_diario/app/modules/home/home_controller.dart';
import 'package:ponto_diario/app/modules/home/home_page.dart';
import 'package:ponto_diario/app/modules/login/login_controller.dart';
import 'package:ponto_diario/app/modules/login/login_page.dart';
import 'package:ponto_diario/app/modules/splash/splash_controller.dart';
import 'package:ponto_diario/app/modules/splash/splash_state.dart';
import 'package:ponto_diario/locator.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SplashController>();
    return Scaffold(
      backgroundColor: Colors.green,
      body: BlocBuilder<SplashController, SplashState>(
        builder: (context, state) {
          if (state is SplashInitial) {
            cubit.checkIfIsLogged();
          } else if (state is SplashLoading) {
            return Center(
              child: Text(
                'Ponto Diário',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.07,
                ),
              ),
            );
          } else if (state is SplashLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (state.isLogged) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: getIt.get<HomeController>(),
                      child: HomePage(),
                    ),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: getIt.get<LoginController>(),
                      child: LoginPage(),
                    ),
                  ),
                );
              }
            });
          }
          return Container();
        },
      ),
    );
  }
}
