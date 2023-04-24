import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:flutter/material.dart';

class AddressChangeHistory extends StatelessWidget {
  const AddressChangeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Change History"),
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
                                  const Text("21/04/2022"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.attach_money_outlined,
                                      color: CommonWidget.primaryColor),
                                  const SizedBox(width: 8),
                                  Container(
                                      width: cWidth,
                                      child: const Text(
                                        "100 Kyats",
                                        textAlign: TextAlign.left,
                                      )),
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
                                        "Address Change test API",
                                        textAlign: TextAlign.left,
                                      )),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: CommonWidget.primaryColor),
                                  const SizedBox(width: 8),
                                  Container(
                                      width: cWidth,
                                      child: const Text(
                                        "No 71, 10 Str, Ngamoeyeik Quarter , Thingangyun Township, Yangon",
                                        textAlign: TextAlign.left,
                                      )),
                                ],
                              ),
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
    );
  }
}
