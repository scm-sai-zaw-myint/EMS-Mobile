import 'package:ems_mobile/Models/Transportation/transportation.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Transportation/transportation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransportationDetailPage extends StatelessWidget{

  const TransportationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransportationService>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CommonWidget.primaryColor,
            title: Text("${controller.transportationDetail.employeeName}"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      // color: CommonWidget.softColor,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 20),
                                      child: Center(
                                        child: Text("Transportation Details",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor)),
                                      ),
                                    ),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Employee Id", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.employeeId??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Name", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.employeeName??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Request Date", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.requestDate??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Travel Date", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.travelDate??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Fees", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text("${controller.transportationDetail.fees??0}", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Source", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.source??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Destination", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.destination??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Travel by", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.travelBy??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Travel type", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.travelType??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Description", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.description??"", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Remark", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(child: Text(controller.transportationDetail.remark??"-", style: const TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                        ]
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                        children: [
                                          Expanded(child: Text("Status", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Chip(

                                                    label: Text(controller.statusList[controller.transportationDetail.status]??"",
                                                      style: const TextStyle(fontSize: 17),
                                                      overflow: TextOverflow.ellipsis, maxLines: 2,),
                                                    backgroundColor: controller.transportationDetail.status == "1" || controller.transportationDetail.status == "7" ? Colors.black26:
                                                    controller.transportationDetail.status == "2" ? Colors.greenAccent:
                                                    controller.transportationDetail.status == "3" ? Colors.redAccent:
                                                    controller.transportationDetail.status == "4" ? Colors.blue:null,
                                                  ),
                                                ],
                                              )
                                          )
                                        ]
                                    ),
                                    controller.transportationDetail.status == "4" ? const Divider(color: Colors.black26,thickness: 2,): const SizedBox(),
                                    controller.transportationDetail.status == "4" ?
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                onPressed: (){},
                                                style: CommonWidget.secondaryButtonStyle(100),
                                                child: const Text("Edit"),
                                              ),
                                              const SizedBox(width: 10,),
                                              ElevatedButton(
                                                onPressed: (){},
                                                style: CommonWidget.primaryButtonStyle(100),
                                                child: const Text("Request"),
                                              )
                                            ],
                                          ),
                                        ) : const SizedBox()
                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        );
      }
    );
  }

}