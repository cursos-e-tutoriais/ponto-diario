import 'package:get/get.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  
  final String urlMap = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  final subdomains = ['a', 'b', 'c'];
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  int selectedIndex = 0;

  void onTapped(i) {
    selectedIndex = i;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await checkPermission();
    _locationData = await location.getLocation();
    print(_locationData);
    
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
