import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Screens/Common/noti_bar.dart';
import 'package:ems_mobile/Services/Login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginService());
  LoginPage({super.key});

  Widget _inputField() {
    return Obx(() => controller.step.value == 1
        ? TextFormField(
            controller: controller.loginIdController.value,
            decoration: CommonWidget.loginInputDecoration("Login ID"),
            validator: (value){
              if(value == null) return "Login Id cannot be null!";
              if(value.isEmpty) return "Login Id cannot be empty";
              return null;
            },
            
          )
        : TextFormField(
            controller: controller.passwordController.value,
            decoration: CommonWidget.passwordInputDecoration(
              "Password",
              controller.isSecurePassword.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
              () => {
                controller.isSecurePassword(!controller.isSecurePassword.value)
              },
              ),
            obscureText: controller.isSecurePassword.value,
            validator: (value){
              if(value == null) return "Password cannot be null!";
              if(value.isEmpty) return "Password cannot be empty";
              return null;
            },

          ));
  }

  Widget _buttonField() {
    return Obx(() => controller.step.value == 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      controller.step(2);
                    }
                  },
                  style: CommonWidget.primaryButtonStyle(),
                  child: Text("Login".toUpperCase()),
                ),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: (){
                    _formKey.currentState!.reset();
                    controller.step(1);
                  },
                  style: CommonWidget.secondaryButtonStyle(),
                  child: Text("Back".toUpperCase()),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      
                    }
                  },
                  style: CommonWidget.primaryButtonStyle(),
                  child: Text("Login".toUpperCase()),
                ),
              )
            ],
          ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _inputField(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buttonField(),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
