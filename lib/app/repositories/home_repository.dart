import 'package:dio/dio.dart';
import 'package:ponto_diario/app/shared/utils.dart';

class HomeRepository {
  final Dio dio;
  HomeRepository(this.dio);

  Future<bool> logout() async {
    String token = box.read('token');

    var res = await dio.get(
      '/logout',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    return res.statusCode == 200;
  }
}
