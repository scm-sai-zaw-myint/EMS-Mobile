
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
  ApiService api = ApiService();

  var processingLogin = false.obs;
  var loginSuccess = false.obs;
  var showSnackbar = false.obs;
  var loginMessage = "".obs;

  Credential? get credential => _credential;

  @override
  void onInit() {
    _processCredential();
    Credential.clearStorage();
    super.onInit();
  }

  Future<bool> login() async {
    processingLogin(true);
    showSnackbar(true);
    final response = await api.post("${Config.domainUrl}${Config.login}", {
      "loginId" : loginIdController.value.text,
      "password" : passwordController.value.text
    });
    processingLogin(false);
    if(response.statusCode == 503){
      loginSuccess(false);
      loginMessage("Enable to fetch the api!");
      return false;
    }
    final body = response.body;
    AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(body));
    if(authResponse.responseCode != 200){
      loginSuccess(false);
      showSnackbar(true);
      loginMessage(authResponse.responseDescription);
      return false;
    }
    Credential.setCredential(authResponse);
    loginSuccess(true);
    showSnackbar(false);
    return true;
  }

  _processCredential() async{
    isLoadingCredential(true);
    await Future.delayed(const Duration(seconds: 2));
    _credential = await Credential.getCredential();
    isLoadingCredential(false);
  }

}