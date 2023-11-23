import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ponto_diario/app/modules/splash/splash_controller.dart';
import 'package:ponto_diario/app/modules/splash/splash_state.dart';

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
            if (state.isLogged) {
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              Navigator.pushReplacementNamed(context, '/login');
            }
          }
          return Container();
        },
      ),
    );
  }
}
