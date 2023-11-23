import 'package:get/get.dart';
import 'package:ponto_diario/app/shared/utils.dart';

class LoginRepository extends GetConnect {
  login(email, pass) async {
    Map data = {
      "email": email,
      "pass": pass,
    };

    var res = await post('http://192.168.1.24:8080/api/v1/login', data);

    print(res.statusCode);

    if (res.statusCode == 200) {
      box.write('token', res.body['token']);
      return true;
    } else {
      return false;
    }
  }
}
