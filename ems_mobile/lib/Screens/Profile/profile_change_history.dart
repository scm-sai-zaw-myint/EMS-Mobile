import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileChangeHistoryPage extends StatelessWidget{
  const ProfileChangeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileService>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Change History"),
          backgroundColor: CommonWidget.primaryColor,
          actions: [
            IconButton(onPressed: (){
              Get.toNamed(Config.profileChangeRequestPage);
            }, icon: const Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Obx((){
              if(controller.isProfileHistoryLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
              return Column(
                children: controller.profileHistory.map((profile){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.profileChangeDetail = profile;
                            Get.toNamed(Config.profileChangeDetailPage);
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
                                            Icon(Icons.change_circle_outlined, size: 60)
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
                                          Text("${profile.employeeName}", style: const TextStyle(fontSize: 18),),
                                          const SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              Chip(
                                                avatar: CircleAvatar(
                                                  backgroundColor: Colors.transparent,
                                                  child: Icon(Icons.update_sharp, color: CommonWidget.primaryColor,),
                                                ),
                                                backgroundColor: CommonWidget.lightColor,
                                                label: Text(DateFormat("dd/MM/yyyy").format(DateTime.fromMillisecondsSinceEpoch(profile.createdDateTime!))),
                                              ),/*
                                              const SizedBox(width: 10,),
                                              Chip(
                                                avatar:  CircleAvatar(
                                                  backgroundColor: Colors.transparent,
                                                  child: Icon(Icons.monetization_on, color: CommonWidget.primaryColor,),
                                                ),
                                                backgroundColor: CommonWidget.lightColor,
                                                label: Text("${profile.employeeName}"),
                                              )*/
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
                              backgroundColor: profile.profileRequestStatus == "1" || profile.profileRequestStatus == "7" ? Colors.black26:
                              profile.profileRequestStatus == "2" ? Colors.greenAccent:
                              profile.profileRequestStatus == "3" ? Colors.redAccent:
                              profile.profileRequestStatus == "4" ? Colors.blue:null,
                              label: Text(
                                  profile.profileRequestStatus == "1" || profile.profileRequestStatus == "7" ? "Pending":
                                  profile.profileRequestStatus == "2" ? "Approved":
                                  profile.profileRequestStatus == "3" ? "Rejected":
                                  profile.profileRequestStatus == "4" ? "Saved" : ""
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