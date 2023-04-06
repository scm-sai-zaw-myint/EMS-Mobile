import 'package:ems_mobile/Services/Login/login_service.dart';
import 'package:ems_mobile/Services/Overtime/overtime_service.dart';
import 'package:ems_mobile/Services/Profile/change_password_service.dart';
import 'package:get/get.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => ChangePasswordService());
    Get.lazyPut(() => OvertimeService());
  }
}
