
import 'dart:convert';

import 'package:ems_mobile/Models/Auth/auth_response.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:ems_mobile/Services/Credential/credential.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginService extends GetxController{

  Credential? _credential;
  var isLoadingCredential = false.obs;

  var step = 1.obs;
  var loginIdController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isSecurePassword = true.obs;
  late ApiService api;

  var loginSuccess = false.obs;

  Credential? get credential => _credential;

  @override
  void onInit() {
    api = ApiService();
    _processCredential();
    super.onInit();
  }

  void login() async {
    final response = await api.post("${Config.domainUrl}${Config.login}", {
      "loginId" : loginIdController.value.text,
      "password" : passwordController.value.text
    });
    if(response.statusCode == 503){
      loginSuccess(false);
      return;
    }
    final body = response.body;
    AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(body));
    if(authResponse.responseCode != 200){
      loginSuccess(false);
      return;
    }
    Credential.setCredential(authResponse);
    loginSuccess(true);
  }

  _processCredential() async{
    isLoadingCredential(true);
    await Future.delayed(const Duration(seconds: 2));
    _credential = await Credential.getCredential();
    isLoadingCredential(false);
  }

}