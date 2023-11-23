import 'package:dio/dio.dart';
import 'package:ponto_diario/app/core/utils.dart';
import 'package:ponto_diario/app/shared/utils.dart';

class SplashRepository {
  final Dio dio;
  SplashRepository(this.dio);

  Future<bool> checkIfIsLogged() async {
    try {
      var token = box.read('token');
      final res = await dio.get(
        '${Utils.urlBase}/data',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return res.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
