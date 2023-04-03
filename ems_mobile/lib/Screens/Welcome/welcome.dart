import 'package:ems_mobile/Screens/Dashboard.dart/dashboard.dart';
import 'package:ems_mobile/Screens/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ems_mobile/Screens/Welcome/controller.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
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
          return controller.credential != null &&
                  controller.credential?.employeeId != null
              ? const Dashboard()
              : LoginPage();
        }

        //  return AnimatedSplashScreen(
        //   splash: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       Image(
        //           image: AssetImage(
        //             "assets/images/logo_green.png",
        //           ),
        //           width: 60,
        //           height: 60),
        //       Text("EMS")
        //     ],
        //   ),
        //   nextScreen:(nextScreen),
        //   animationDuration: const Duration(seconds: 10),
        //   );
      }),
    );
  }
}
