import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ponto_diario/app/modules/home/home_controller.dart';
import 'package:ponto_diario/app/modules/home/home_state.dart';
import 'package:ponto_diario/app/modules/login/login_controller.dart';
import 'package:ponto_diario/app/modules/login/login_page.dart';
import 'package:ponto_diario/app/modules/settings/settings_page.dart';
import 'package:ponto_diario/locator.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeController>();
    cubit.onInit();
    return BlocBuilder<HomeController, HomeState>(builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBar(
                      title: Text('INÍCIO'),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.exit_to_app),
                          color: Colors.white,
                          onPressed: () {
                            cubit.logout().then(
                                  (value) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value: getIt.get<LoginController>(),
                                        child: LoginPage(),
                                      ),
                                    ),
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Bem Vindo! João',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Text(
                      '${cubit.date.day}/${cubit.date.month}/${cubit.date.year}',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              child: DigitalClock(
                digitAnimationStyle: Curves.elasticOut,
                is24HourTimeFormat: true,
                areaDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                hourMinuteDigitTextStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 50,
                ),
                amPmDigitTextStyle: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.01,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.40,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(cubit.init == null || cubit.init == ''
                              ? 'inicio'
                              : cubit.init.toString()),
                          Text(cubit.end == null || cubit.end == ''
                              ? 'final'
                              : cubit.end.toString()),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () {
                        final canInitPoint = cubit.canInitPoint();
                        if (canInitPoint == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Olá Para poder registrar ponto, cadastre a localização do seu trabalho.\nPara fazer isso é só acessar as configurações do app!',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: cubit.isClicked ? Colors.orange : Colors.green,
                        ),
                        child: Center(
                          child: cubit.isClicked
                              ? Text(
                                  'Finalizar ponto',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )
                              : Text(
                                  'Iniciar ponto',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FloatingActionButton(
                          heroTag: '1',
                          onPressed: null,
                          child: Icon(Icons.menu),
                          backgroundColor: Colors.green,
                        ),
                        FloatingActionButton(
                          heroTag: '2',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SettingsPage(),
                              ),
                            );
                          },
                          child: Icon(Icons.settings),
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
