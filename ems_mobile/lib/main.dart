import 'package:ems_mobile/Screens/Common/screen_pages.dart';
import 'package:ems_mobile/Screens/Welcome/welcome.dart';
import 'package:ems_mobile/Screens/Welcome/welcome_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: "EMS Mobile",
    home: const Welcome(),
    initialBinding: WelcomeBinding(),
    getPages: ScreenPages.pages,
  ));
}