import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: ,
      backgroundColor: const Color.fromARGB(255, 94, 147, 105),
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
                        Icons.time_to_leave, "Leave", false, ""),
                  ),
                  Container(width: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: CommonWidget.cardStyle(
                        Icons.timer_sharp, "Overtime Request", false, ""),
                  ),
                ],
              ),
              Container(height: 15),
              Row(
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: CommonWidget.cardStyle(null, "Attendance", true,
                          'assets/images/attendance.png')),
                  Container(width: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: CommonWidget.cardStyle(Icons.maps_home_work_outlined,
                        "Address Change", false, ""),
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
                        Icons.person_sharp, "Profile Change", false, ""),
                  ),
                  Container(width: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: CommonWidget.cardStyle(
                        Icons.thermostat, "Daily Temperature", false, ""),
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
