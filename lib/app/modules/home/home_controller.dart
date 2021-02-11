import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/repositories/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;

  HomeController({@required this.homeRepository})
      : assert(homeRepository != null);

  bool isClicked = false;
  SharedPreferences prefs;
  bool serviceEnabled;
  LocationPermission permission;
  Position position;
  var date = DateTime.now();

  @override
  void onInit() async {
    super.onInit();
    await checkPermission();
    await checkWorkLocationCondition();
  }

  final _init = ''.obs;
  get init => _init;
  set init(value) => _init.value = value;

  final _end = ''.obs;
  get end => _end;
  set end(value) => _end.value = value;

  final _position = Position().obs;
  Position get positionActual => _position.value;
  set positionActual(value) => _position.value = value;

  final _workRegistered = false.obs;
  get workRegistered => _workRegistered.value;
  set workRegistered(value) => _workRegistered.value = value;

  checkWorkLocationCondition() async {
    prefs = await SharedPreferences.getInstance();
    bool isWorkLocationRegistered = prefs.getBool('isWorkLocationRegistered');
    workRegistered = isWorkLocationRegistered;
    print(workRegistered);
    update();
  }

  checkPermission() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('O serviço de localização foi desabilitado!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'O serviço de localização foi desabilitado permanentemente. Nós não podemos ter acesso a sua localização!');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'O serviço de localização está desabilitado (permissão atual: $permission).');
      }
    }

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    positionActual = position;
    return position;
  }

  initPoint() async {
    var hour = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    String initHour = '${hour.hour}:${hour.minute}:${hour.second}';
    String initHourSaved = prefs.getString('initHour');
    if ((isClicked == true) && (initHour != initHourSaved)) {
      prefs.setString('initHour', initHour);
      init = initHour;
    }
    update();
  }

  endPoint() async {
    var hour = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    String finalHour = '${hour.hour}:${hour.minute}:${hour.second}';
    String finalHourSaved = prefs.getString('finalHour');
    if ((isClicked == false) && (finalHour != finalHourSaved)) {
      prefs.setString('finalHour', finalHour);
      end = finalHour;
    }
    update();
  }

  buttonClicked() {
    if (isClicked == false && workRegistered == true) {
      isClicked = true;
      initPoint();
    } else if (isClicked == true && workRegistered == true) {
      isClicked = false;
      endPoint();
    } else {
      Get.snackbar(
        'Oops!',
        'Olá Para poder registrar ponto, cadastre a localização do seu trabalho.\nPara fazer isso é só acessar as configurações do app!',
      );
    }
  }

  logout() async {
    prefs = await SharedPreferences.getInstance();
    //bool isLogged = await homeRepository.logout();
    prefs.setString('token', null);
    prefs.setBool('isWorkLocationRegistered', false);
    prefs.setString('token', null);
    Get.offAllNamed('/login');
  }

  goToSettingsPage() {
    Get.toNamed('/settings');
  }
}
