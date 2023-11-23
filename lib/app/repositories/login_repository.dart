import 'package:dio/dio.dart';
import 'package:ponto_diario/app/shared/utils.dart';

class LoginRepository {
  final Dio dio;

  LoginRepository(this.dio);

  Future<bool> login(email, pass) async {
    try {
      final res = await dio.post(
        '/login',
        data: {
          "email": email,
          "pass": pass,
        },
      );

      if (res.statusCode == 200) {
        box.write('token', res.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
