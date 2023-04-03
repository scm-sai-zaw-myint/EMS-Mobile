import 'package:ems_mobile/Services/Credential/credential.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  Credential? _credential;
  var isLoadingCredential = false.obs;

  Credential? get credential => _credential;

  @override
  void onInit() {
    _processCredential();
    super.onInit();
  }
  _processCredential() async{
    isLoadingCredential(true);
    await Future.delayed(const Duration(seconds: 5));
    _credential = await Credential.getCredential();
    isLoadingCredential(false);
  }
}