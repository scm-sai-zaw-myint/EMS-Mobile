import 'package:ems_mobile/Screens/Dashboard/dashboard.dart';
import 'package:ems_mobile/Screens/Login/login_page.dart';
import 'package:ems_mobile/Screens/Profile/change_password.dart';
import 'package:ems_mobile/Screens/Profile/profile.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:get/get.dart';

class PagesConfig {
  static final List<GetPage> pages = [
    GetPage(name: Config.loginPage, page: () => LoginPage()),
    GetPage(name: Config.dashboardPage, page: () => const Dashboard()),
    GetPage(name: Config.changePasswordPage, page: () => ChangePassword()),
    GetPage(name: Config.profilePage, page: () => const Profile())
  ];
}
