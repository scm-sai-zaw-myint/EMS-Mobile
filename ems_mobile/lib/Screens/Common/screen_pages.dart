import 'package:ems_mobile/Screens/Common/screen_routes.dart';
import 'package:ems_mobile/Screens/Login/login_binding.dart';
import 'package:ems_mobile/Screens/Login/login_page.dart';
import 'package:get/get.dart';

class ScreenPages {
  static final List<GetPage> pages = [
    GetPage(
        name: ScreenRoutes.login, page: () => LoginPage(), binding: LoginBinding())
  ];
}
