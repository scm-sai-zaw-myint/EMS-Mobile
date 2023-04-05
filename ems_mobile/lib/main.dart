// import 'package:ems_mobile/Screens/Common/screen_pages.dart';
import 'package:ems_mobile/Screens/Leave/leave_history.dart';
// import 'package:ems_mobile/Screens/Profile/profile.dart';
// import 'package:ems_mobile/Screens/Welcome/welcome.dart';
// import 'package:ems_mobile/Screens/Welcome/welcome_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    title: "EMS Mobile",
    home: LeaveHistory(),
    // initialBinding: WelcomeBinding(),
    // getPages: ScreenPages.pages,
    debugShowCheckedModeBanner: false,
  ));
}
