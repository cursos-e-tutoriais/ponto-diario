import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository extends GetConnect {
  SharedPreferences prefs;
  logout() async {
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');

    var res = await get('http://127.0.0.1:8080/api/v1/logout', headers: {
      'Authorization': 'Bearer $token'
    });

    if (res.statusCode == 200) {
      prefs.setString('token', res.body['token']);
      return true;
    } else {
      return false;
    }
  }
}