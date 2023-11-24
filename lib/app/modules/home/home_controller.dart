import 'package:bloc/bloc.dart';
import 'package:ponto_diario/app/modules/home/home_state.dart';
import 'package:ponto_diario/app/repositories/home_repository.dart';
import 'package:ponto_diario/app/shared/utils.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository}) : super(HomeInitial());

  bool isClicked = false;
  late bool serviceEnabled;
  late LocationPermission permission;
  var date = DateTime.now();

  void onInit() async {
    await checkPermission();
    await checkWorkLocationCondition();
  }

  String _init = '';
  get init => _init;
  set init(value) => _init = value;

  String _end = '';
  get end => _end;
  set end(value) => _end = value;

  late Position _position;
  Position get positionActual => _position;

  set positionActual(Position value) => _position = value;

  bool _workLocationRegistered = false;
  get workLocationRegistered => _workLocationRegistered;
  set workLocationRegistered(value) => _workLocationRegistered = value;

  Future<void> checkWorkLocationCondition() async {
    bool isWorkLocationRegistered = box.read('isWorkLocationRegistered');
    workLocationRegistered = isWorkLocationRegistered;
    print(workLocationRegistered);
  }

  Future checkPermission() async {
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

    final _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    positionActual = _currentPosition;
    return _currentPosition;
  }

  Future<void> initPoint() async {
    var hour = DateTime.now();
    String initHour = '${hour.hour}:${hour.minute}:${hour.second}';
    String initHourSaved = box.read('initHour');
    if ((isClicked == true) && (initHour != initHourSaved)) {
      box.write('initHour', initHour);
      init = initHour;
    }
  }

  Future<void> endPoint() async {
    var hour = DateTime.now();
    String finalHour = '${hour.hour}:${hour.minute}:${hour.second}';
    String finalHourSaved = box.read('finalHour');
    if ((isClicked == false) && (finalHour != finalHourSaved)) {
      box.write('finalHour', finalHour);
      end = finalHour;
    }
  }

  bool? canInitPoint() {
    if (isClicked == false && workLocationRegistered == true) {
      isClicked = true;
      initPoint();
    } else if (isClicked == true && workLocationRegistered == true) {
      isClicked = false;
      endPoint();
    } else {
      return false;
    }
    return true;
  }

  Future<void> logout() async {
    box.write('token', null);
    box.write('isWorkLocationRegistered', false);
    box.write('token', null);
  }
}
