import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Screens/Common/dashboard_card.dart';
import 'package:ems_mobile/Screens/Overtime/overtime_report.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(key: null,),
      backgroundColor: const Color.fromARGB(255, 192, 235, 255),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 60,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: CommonWidget.cardStyle(
                        Icons.time_to_leave, "Leave", () => {}),
                  ),
                  Container(width: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: CommonWidget.cardStyle(
                      Icons.timer_sharp,
                      "Overtime Request",
                      () => {
                        Get.toNamed(Config.OvertimeRequestPage),
                      },
                    ),
                  ),
                ],
              ),
              Container(height: 15),
              Row(
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: CommonWidget.cardStyle(
                          Icons.checklist_rounded, "Attendance", () => {})),
                  Container(width: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: CommonWidget.cardStyle(Icons.maps_home_work_outlined,
                        "Address Change", () => {}),
                  ),
                ],
              ),
              Container(height: 15),
              Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: CommonWidget.cardStyle(
                        Icons.person_sharp, "Profile Change", () => {}),
                  ),
                  Container(width: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: CommonWidget.cardStyle(
                        Icons.thermostat, "Daily Temperature", () => {}),
                  ),
                ],
              ),
              Container(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
