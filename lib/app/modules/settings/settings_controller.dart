import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/models/nominatim_model.dart';
import 'package:ponto_diario/app/repositories/settings_repository.dart';

class SettingsController extends GetxController with StateMixin<List<NominatimModel>> {
  final SettingsRepository settingsRepository;
  SettingsController({ @required this.settingsRepository });

  bool addressReceived = false;
  var streetController = TextEditingController();

  void onInit() async {
    super.onInit();
  }

  getAddressInfo(address) async {
    await settingsRepository.getDataFromNominatim(address).then((address) {
      List<NominatimModel> addressData = address;
      addressReceived = true;
      change(addressData, status: RxStatus.success());
    }, onError: (e) {
      addressReceived = false;
      change(null, status: RxStatus.error('Não foram encontrados endereços $e'));
    });
  }
}