import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/settings/settings_controller.dart';
import 'package:ponto_diario/app/repositories/settings_repository.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => SettingsController(settingsRepository: SettingsRepository()));
  }
}
