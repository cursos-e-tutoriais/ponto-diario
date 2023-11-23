import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ponto_diario/app/modules/login/login_state.dart';
import 'package:ponto_diario/app/repositories/login_repository.dart';

class LoginController extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLogged = false;
  LoginController({required this.loginRepository}) : super(LoginInitial());

  Future<void> login(email, pass) async {
    emit(LoginLoading());
    isLogged = await loginRepository.login(email, pass);
    emit(LoginLoaded());
  }
}
