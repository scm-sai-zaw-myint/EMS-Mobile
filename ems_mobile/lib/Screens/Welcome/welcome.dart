import 'package:ems_mobile/Screens/Dashboard.dart/dashboard.dart';
import 'package:ems_mobile/Screens/Login/login_page.dart';
import 'package:ems_mobile/Screens/Profile/change_password.dart';
import 'package:ems_mobile/Services/Login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginService>(
      builder: (controller) => Obx(() {
        if (controller.isLoadingCredential.value) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                      image: AssetImage(
                        "assets/images/logo_green.png",
                      ),
                      width: 60,
                      height: 60),
                ],
              ),
            ),
          );
        } else {
          return controller.credential?.employeeId == null ? LoginPage()
              : ChangePassword();
        }
      }),
    );
  }
}
