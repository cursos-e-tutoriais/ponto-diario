import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ponto_diario/app/models/nominatim_model.dart';

class SettingsRepository {
  final Dio dio;

  SettingsRepository(this.dio);

  Future<List<NominatimModel>?> getDataFromNominatim(String address) async {
    List<NominatimModel> addressData = [];
    try {
      final res = await dio.get(
        'https://nominatim.openstreetmap.org/search?q=$address&format=json',
      );
      if (res.data != null) {
        for (var item in res.data) {
          addressData.add(NominatimModel.fromJson(item));
        }
      }
    } catch (e) {
      debugPrint("Erro $e");
    }
    return addressData;
  }
}
