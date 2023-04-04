import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Screens/Common/noti_bar.dart';
import 'package:ems_mobile/Screens/Common/screen_routes.dart';
import 'package:ems_mobile/Services/Login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  Widget _inputField(controller) {
    return Obx(() => controller.step.value == 1
        ? TextFormField(
            controller: controller.loginIdController.value,
            decoration: CommonWidget.loginInputDecoration("Login ID"),
            validator: (value) {
              if (value == null) return "Login Id cannot be null!";
              if (value.isEmpty) return "Login Id cannot be empty";
              return null;
            },
          )
        : TextFormField(
            controller: controller.passwordController.value,
            decoration: CommonWidget.passwordInputDecoration(
              "Password",
              controller.isSecurePassword.value
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              () => {
                controller.isSecurePassword(!controller.isSecurePassword.value)
              },
            ),
            obscureText: controller.isSecurePassword.value,
            validator: (value) {
              if (value == null) return "Password cannot be null!";
              if (value.isEmpty) return "Password cannot be empty";
              return null;
            },
          ));
  }

  Widget _buttonField(LoginService controller, context) {
    return Obx(() => controller.step.value == 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
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
                  onPressed: () {
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
                  onPressed: () async {
                    if (controller.processingLogin.value) return;
                    if (_formKey.currentState!.validate()) {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      NotiBar.showSnackbar(context, "Logging In", "Please wait", ContentType.help);
                      await Future.delayed(const Duration(seconds: 3));
                      bool login = await controller.login();
                      if (login) {
                        Get.toNamed(ScreenRoutes.changePassword);
                      } else {
                        NotiBar.showSnackbar(context, "Login fails",
                            controller.loginMessage.value, ContentType.failure);
                      }
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
    return GetBuilder<LoginService>(
      builder: (controller) {
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
                      _inputField(controller),
                      const SizedBox(
                        height: 20,
                      ),
                      _buttonField(controller, context),
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
      },
    );
  }
}
