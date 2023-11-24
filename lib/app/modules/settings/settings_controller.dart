import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ponto_diario/app/models/nominatim_model.dart';
import 'package:ponto_diario/app/modules/settings/settings_state.dart';
import 'package:ponto_diario/app/repositories/settings_repository.dart';
import 'package:ponto_diario/app/shared/utils.dart';

class SettingsController extends Cubit<SettingsState> {
  final SettingsRepository settingsRepository;
  SettingsController({required this.settingsRepository})
      : super(SettingsInitial());

  final streetController = TextEditingController();
  bool addressReceived = false;

  Future<void> getAddressInfo(String? value) async {
    emit(SettingsLoading());
    final address = await settingsRepository
        .getDataFromNominatim(value ?? streetController.text);
    emit(SettingsLoaded(addressData: address ?? []));
  }

  Future<void> registerWorkLocation(String lat, String lng) async {
    box.write('latWork', lat);
    box.write('lngWork', lng);
    box.write('isWorkLocationRegistered', true);
  }
}
