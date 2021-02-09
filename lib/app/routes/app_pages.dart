import 'package:ponto_diario/app/modules/home/home_page.dart';
import 'package:ponto_diario/app/modules/home/home_binding.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/login/login_bindings.dart';
import 'package:ponto_diario/app/modules/login/login_page.dart';
import 'package:ponto_diario/app/modules/splash/splash_bindings.dart';
import 'package:ponto_diario/app/modules/splash/splash_page.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.HOME, 
      page:()=> HomePage(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),    
  ];
}