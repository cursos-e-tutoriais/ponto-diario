import 'package:ponto_diario/app/modules/home/home_page.dart';
import 'package:ponto_diario/app/modules/home/home_binding.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/login/login_bindings.dart';
import 'package:ponto_diario/app/modules/login/login_page.dart';
import 'package:ponto_diario/app/modules/settings/settings_bindings.dart';
import 'package:ponto_diario/app/modules/settings/settings_page.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsPage(),
      binding: SettingsBindings(),
    ),
  ];
}
