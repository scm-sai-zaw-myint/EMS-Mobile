import 'package:ems_mobile/Screens/Welcome/controller.dart';
import 'package:get/get.dart';

class WelcomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
  }
}