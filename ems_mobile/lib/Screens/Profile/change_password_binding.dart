import 'package:ems_mobile/Services/Profile/change_password_service.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() => Get.lazyPut(() => ChangePasswordService());
}