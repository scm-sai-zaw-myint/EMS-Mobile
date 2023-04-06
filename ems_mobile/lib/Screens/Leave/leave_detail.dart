import 'package:ems_mobile/Models/Employee/employee.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
// import 'package:ems_mobile/Services/Common/config.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveDetail extends StatefulWidget {
  const LeaveDetail({super.key});

  @override
  State<LeaveDetail> createState() => _LeaveDetailState();
}

class _LeaveDetailState extends State<LeaveDetail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileService>(builder: (controller) {
      controller.getProfile();
      return Scaffold(
        appBar: AppBar(title: const Text('Leave Detail')),
        body: Container(
            decoration: CommonWidget.commonBackground(),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CommonWidget.profileTitle("Leave Detail Information"),
                          const SizedBox(height: 10),
                          Wrap(
                            children: [
                              CommonWidget.profileRow("Employee ID", "-"),
                              CommonWidget.profileRow("Employee Name", "-"),
                              CommonWidget.profileRow("Department", "-"),
                              CommonWidget.profileRow("Approved Date", "-"),
                              CommonWidget.profileRow("Requested Date", "-"),
                              CommonWidget.profileRow("Leave Date", "-"),
                              CommonWidget.profileRow("Total Day", "-"),
                              CommonWidget.profileRow("Leave Type", "-"),
                              CommonWidget.profileRow("Status", "-"),
                              CommonWidget.profileRow("Leave Reason", "-"),
                              CommonWidget.profileRow("Remark", "-"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }
}
