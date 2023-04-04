import 'package:ems_mobile/Screens/Common/screen_routes.dart';
import 'package:ems_mobile/Screens/Dashboard.dart/dashboard.dart';
import 'package:ems_mobile/Screens/Login/login_binding.dart';
import 'package:ems_mobile/Screens/Login/login_page.dart';
import 'package:ems_mobile/Screens/Profile/change_password.dart';
import 'package:ems_mobile/Screens/Profile/change_password_binding.dart';
import 'package:get/get.dart';

class ScreenPages {
  static final List<GetPage> pages = [
    GetPage(
        name: ScreenRoutes.login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: ScreenRoutes.dashboard, page: () => const Dashboard(), binding: LoginBinding()),
    GetPage(name: ScreenRoutes.changePassword, page: ()=> ChangePassword(), binding: ChangePasswordBinding())
  ];
}
