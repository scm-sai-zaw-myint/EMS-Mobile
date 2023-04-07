import 'package:ems_mobile/Services/Leave/leave_service.dart';
import 'package:ems_mobile/Services/Login/login_service.dart';
import 'package:ems_mobile/Services/Overtime/overtime_service.dart';
import 'package:ems_mobile/Services/Profile/change_password_service.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:get/get.dart';

import '../Dashboard/dashboard_service.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => DashboardService());
    Get.lazyPut(() => ChangePasswordService());
    Get.lazyPut(() => ProfileService());
    Get.lazyPut(() => LeaveService());
    Get.lazyPut(() => OvertimeService());

  }
}
