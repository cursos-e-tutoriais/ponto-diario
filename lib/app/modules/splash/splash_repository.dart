import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepository extends GetConnect{
  checkIfIsLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var res = await get('http://127.0.0.1:8080/api/v1/data', 
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (res.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }
}