import 'package:ems_mobile/Services/Login/login_service.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginService());
  }
}