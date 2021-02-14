import 'package:get/get.dart';
import 'package:ponto_diario/app/shared/utils.dart';

class HomeRepository extends GetConnect {
  logout() async {
    String token = box.read('token');

    var res = await get('http://127.0.0.1:8080/api/v1/logout', headers: {
      'Authorization': 'Bearer $token'
    });

    if (res.statusCode == 200) {
      box.write('token', res.body['token']);
      return true;
    } else {
      return false;
    }
  }
}