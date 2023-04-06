import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Screens/Common/drawer_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonWidget.primaryColor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            );
          },
        ),
        title: const Text("Dashboard"),
      ),
      backgroundColor: CommonWidget.lightColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          // Get.toNamed(Config.OvertimeRequestPage),
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
      ),
      drawer: const SafeArea(
        child:  DrawerWidget(
          employeeName: "Ma May Soe Thinzar Moe",
        ),
      ),
    );
  }
}
