import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Overtime/overtime_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OvertimeHistory extends StatelessWidget {
  const OvertimeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.45;
    return GetBuilder<OvertimeService>(builder: (controller) {
      // controller.getOvertimeList();
      controller.fetchOvertimeHistory(DateTime.now());
      return Obx(() {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Overtime History"),
            backgroundColor: CommonWidget.primaryColor,
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: CommonWidget.commonBackground(),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonWidget.commonLeftLeave("3.0 hr"),
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
                                      const Text("06/04/2022"),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_outlined,
                                          color: CommonWidget.primaryColor),
                                      const SizedBox(width: 8),
                                      const Text("17:00~20:00"),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.message,
                                          color: CommonWidget.primaryColor),
                                      const SizedBox(width: 8),
                                      Container(
                                          width: cWidth,
                                          child: const Text(
                                            "Overtime Report For test API",
                                            textAlign: TextAlign.left,
                                          )),
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
                                            color: CommonWidget.primaryColor)),
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
        );},
      );
    });
  }
}
