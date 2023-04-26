import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/Common/config.dart';
import '../Common/common_widget.dart';

class ProfileChangeDetail extends StatelessWidget{
  const ProfileChangeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileService>(
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: CommonWidget.primaryColor,
                title: Text("${controller.profileChangeDetail.employeeName}"),
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
                                          padding: const EdgeInsets.only(bottom: 10),
                                          child: Center(
                                            child: Text("Profile Change Details",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor)),
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Employee Id", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.employeeId??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.email != controller.employee.email ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Name", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.employeeName??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.email != controller.employee.email ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Position", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.position??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.email != controller.employee.email ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Private Email", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.email??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.email != controller.employee.email ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Office Email", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text("${controller.profileChangeDetail.officeEmail??0}", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.officeEmail != controller.employee.officeEmail ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Bank Account", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.bankAccount??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.bankAccount != controller.employee.bankAccount ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Bank Account Type", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.bankAccountType[controller.profileChangeDetail.bankAccountType]??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.bankAccountType != controller.employee.bankAccountType ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Contact Person", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.contactPerson??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.contactPerson != controller.employee.contactPerson ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Contact Person Phone", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.contactPerson??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.contactPhone != controller.employee.contactPhone ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Relation", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.relation??"", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.relation != controller.employee.relation ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("MAC Address", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.macAddress??"-", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.macAddress != controller.employee.macAddress ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("PC Number", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.pcNo??"-", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.pcNo != controller.employee.pcNo ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("PC Password", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(child: Text(controller.profileChangeDetail.pcPassword??"-", style: TextStyle(fontSize: 17,color: controller.profileChangeDetail.pcPassword != controller.employee.pcPassword ? CommonWidget.primaryColor:Colors.black), overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.end,))
                                            ]
                                        ),
                                        const Divider(thickness: 2,),
                                        const SizedBox(height: 10,),
                                        Row(
                                            children: [
                                              Expanded(child: Text("Status", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CommonWidget.primaryColor), overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Chip(

                                                        label: Text(Config.statusList[controller.profileChangeDetail.profileRequestStatus]??"",
                                                          style: const TextStyle(fontSize: 17),
                                                          overflow: TextOverflow.ellipsis, maxLines: 2,),
                                                        backgroundColor: controller.profileChangeDetail.profileRequestStatus == "1" || controller.profileChangeDetail.profileRequestStatus == "7" ? Colors.black26:
                                                        controller.profileChangeDetail.profileRequestStatus == "2" ? Colors.greenAccent:
                                                        controller.profileChangeDetail.profileRequestStatus == "3" ? Colors.redAccent:
                                                        controller.profileChangeDetail.profileRequestStatus == "4" ? Colors.blue:null,
                                                      ),
                                                    ],
                                                  )
                                              )
                                            ]
                                        ),
                                        controller.profileChangeDetail.profileRequestStatus == "4" ? const Divider(color: Colors.black26,thickness: 2,): const SizedBox(),
                                        controller.profileChangeDetail.profileRequestStatus == "4" ?
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                onPressed: (){
                                                  
                                                },
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