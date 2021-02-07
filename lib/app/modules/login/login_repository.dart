import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository extends GetConnect {
  login(email, pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "email": email,
      "pass": pass,
    };

    var res = await post('http://127.0.0.1:8080/api/v1/login', data);

    print(res.statusCode);

    if (res.statusCode == 200){
      prefs.setString('token', res.body['token']);
      return true;
    } else {
      return false;
    }
  }
}