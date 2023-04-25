import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Leave/leave_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveService>(builder: (controller) {
      controller.getLeave();
      return Obx(() => Scaffold(
            appBar: AppBar(
              title: const Text("Attendance History"),
            ),
            body: SingleChildScrollView(
              child: Container(
                decoration: CommonWidget.commonBackground(),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0XFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 3,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonWidget.commonLeftLeave("1.0 D"),
                                CommonWidget.profileTitle("TBD")
                              ],
                            ),
                            title: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month,
                                            color: CommonWidget.primaryColor),
                                        const SizedBox(width: 8),
                                        const Text("05/04/2022"),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(Icons.message,
                                            color: CommonWidget.primaryColor),
                                        const SizedBox(width: 8),
                                        const Text("Event Name"),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: CommonWidget.primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text("Request",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  CommonWidget.primaryColor)),
                                    )),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                // );
                //   },
                // )
              ),
            ),
          ));
    });
  }
}
