import 'package:get/get.dart';
import 'package:ponto_diario/app/models/nominatim_model.dart';

class SettingsRepository extends GetConnect {
  Future<List<NominatimModel>?> getDataFromNominatim(String address) async {
    var response = await get<List<NominatimModel>>(
      'https://nominatim.openstreetmap.org/search?q=$address&format=json',
      decoder: (data) {
        List<NominatimModel> response = List<NominatimModel>.from(
          data.map(
            (address) => NominatimModel.fromJson(address),
          ),
        );
        return response;
      },
    );
    return response.body;
  }
}
