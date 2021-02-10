import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  bool isClicked = false;
  var date = DateTime.now();

  @override
  void onInit() async {
    super.onInit();
    await checkPermission();
    _locationData = await location.getLocation();
    print(_locationData);
  }

  initPoint() async {
    var hour = DateTime.now();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String initHour = '${hour.hour}:${hour.minute}:${hour.second}';    
    print('Iniciado às: $initHour');
    String initHourSaved = prefs.getString('initHour');
    if ((isClicked == true) && (initHour != initHourSaved)){
      prefs.setString('initHour', initHour);
      initHour = initHourSaved;
    }
    update();
  }

  endPoint() async {
    var hour = DateTime.now();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String finalHour = '${hour.hour}:${hour.minute}:${hour.second}';
    print('Finalizado às: $finalHour');
    String finalHourSaved = prefs.getString('finalHour');
    if ((isClicked == false) && (finalHour != finalHourSaved)){
      prefs.setString('finalHour', finalHour);
    }
    update();
  }

  checkPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    } else {
      return;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return;
      }
    }
  }
}
