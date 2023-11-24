import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ponto_diario/app/modules/home/home_controller.dart';
import 'package:ponto_diario/app/modules/home/home_page.dart';
import 'package:ponto_diario/app/modules/login/login_controller.dart';
import 'package:ponto_diario/app/modules/login/login_state.dart';
import 'package:ponto_diario/app/shared/utils.dart';
import 'package:ponto_diario/locator.dart';

import 'widgets/text_form_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
              child: Center(
                child: Text(
                  'PONTO DIÁRIO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      textFormField(cubit.emailController, 'Login',
                          'rodriguesjeff.dev@gmail.com', false),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      textFormField(
                          cubit.passController, 'Senha', '********', true),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: BlocBuilder<LoginController, LoginState>(
                            builder: (context, state) {
                          return GestureDetector(
                            onTap: () async {
                              await cubit.login(
                                cubit.emailController.text,
                                cubit.passController.text,
                              );
                              if (state is LoginLoaded) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider.value(
                                      value: getIt.get<HomeController>(),
                                      child: HomePage(),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              child: Center(
                                child: state is LoginLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
