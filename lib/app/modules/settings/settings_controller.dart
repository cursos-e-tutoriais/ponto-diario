import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/models/nominatim_model.dart';
import 'package:ponto_diario/app/repositories/settings_repository.dart';
import 'package:ponto_diario/app/shared/utils.dart';

class SettingsController extends GetxController
    with StateMixin<List<NominatimModel>> {
  final SettingsRepository settingsRepository;
  SettingsController({required this.settingsRepository});

  final streetController = TextEditingController();
  bool addressReceived = false;

  void onInit() async {
    super.onInit();
  }

  getAddressInfo(address) async {
    await settingsRepository.getDataFromNominatim(address).then((address) {
      List<NominatimModel> addressData = address ?? [];
      addressReceived = true;
      change(addressData, status: RxStatus.success());
    }, onError: (e) {
      addressReceived = false;
      change(null,
          status: RxStatus.error('Não foram encontrados endereços $e'));
    });
  }

  registerWorkLocation(String lat, String lng) async {
    box.write('latWork', lat);
    box.write('lngWork', lng);
    box.write('isWorkLocationRegistered', true);
    Get.back();
    update();
  }
}
