import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:ems_mobile/Services/Transportation/transportation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransportationHistoryPage extends StatelessWidget{
  const TransportationHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransportationService>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Transportation History"),
          backgroundColor: CommonWidget.primaryColor,
          actions: [
            IconButton(onPressed: (){
              Get.toNamed(Config.transportationRequestPage);
            }, icon: const Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Obx((){
              return Column(
                children: controller.transportationList.map((e){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.transportationDetail = e;
                            Get.toNamed(Config.transportationDetailPage);
                          },
                          child: Card(
                            color: CommonWidget.softColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.emoji_transportation, size: 60)
                                        ],
                                      ),
                                    )
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${e.employeeName}", style: const TextStyle(fontSize: 18),),
                                          const SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              Chip(
                                                avatar: CircleAvatar(
                                                  backgroundColor: Colors.transparent,
                                                  child: Icon(Icons.update_sharp, color: CommonWidget.primaryColor,),
                                                ),
                                                backgroundColor: CommonWidget.lightColor,
                                                label: Text("${e.travelDate}"),
                                              ),
                                              const SizedBox(width: 10,),
                                              Chip(
                                                avatar:  CircleAvatar(
                                                  backgroundColor: Colors.transparent,
                                                  child: Icon(Icons.monetization_on, color: CommonWidget.primaryColor,),
                                                ),
                                                backgroundColor: CommonWidget.lightColor,
                                                label: Text("${e.fees}"),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                            right: 15,
                            child: Chip(
                              elevation: 6,
                              backgroundColor: e.status == "1" || e.status == "7" ? Colors.black26:
                              e.status == "2" ? Colors.greenAccent:
                              e.status == "3" ? Colors.redAccent:
                              e.status == "4" ? Colors.blue:null,
                              label: Text(
                                  e.status == "1" || e.status == "7" ? "Pending":
                                      e.status == "2" ? "Approved":
                                          e.status == "3" ? "Rejected":
                                              e.status == "4" ? "Saved" : ""
                              ),
                            )
                        )
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          ),
        ),
      );
    },);
  }
  
}