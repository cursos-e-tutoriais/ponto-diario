import 'package:get/get.dart';
import 'package:ponto_diario/app/shared/utils.dart';

class SplashRepository extends GetConnect{
  checkIfIsLogged() async {
    var token = box.read('token');
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