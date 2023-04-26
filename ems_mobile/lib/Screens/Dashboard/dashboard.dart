import 'package:ems_mobile/Screens/Common/calendar_widget.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Screens/Common/drawer_widget.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:ems_mobile/Services/Dashboard/dashboard_service.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> periods = [
    "Morning",
    "Evening",
    "Full"
  ];
  final List<String> status = [
    "Casual",
    "Sick",
    "Absent",
    "Special Leave",
    "Compensatory",
    "Unpaid"
  ];

  @override
  void dispose() {
    super.dispose();
  }

  String _getPeriod(int index)=>periods[index - 1];
  @override
  Widget build(BuildContext context) {
    ProfileService profileService = Get.find();
    // profileService.getProfile();
    return GetBuilder<DashboardService>(
      builder: (controller) {
        return Scaffold(
          // backgroundColor: CommonWidget.lightColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Builder(
                        builder: (context) {
                          return IconButton(onPressed: () => {
                            Scaffold.of(context).openDrawer()
                          }, icon: const Icon(Icons.menu));
                        }
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon( DateTime.now().hour < 12 ? Icons.sunny_snowing : Icons.sunny ),
                              const SizedBox(width: 10,),
                              Text(
                                controller.greeting,
                                style: const TextStyle(fontSize: 18,),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: CommonWidget.primaryColor,
                        child: IconButton(
                            color: Colors.transparent,
                            padding: EdgeInsets.zero,
                            onPressed: () => {
                              Get.toNamed(Config.profilePage)
                            },
                            icon: CircleAvatar(
                              child: ClipOval(child: profileService.commonImageWidget()),
                            ),
                      ),)
                    ],
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const CalendarWidget(),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: const [
                                Text(
                                  "Leave",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ]),
                              const SizedBox(height: 10),
                              Obx((){
                                if(controller.isLeaveLoading){
                                  return const Center(child: CircularProgressIndicator());
                                }
                                if(controller.getLeaveHistory.isEmpty){
                                  return const Center(child: Text("No leave history."));
                                }
                                return Wrap(
                                  spacing: 5,
                                  runSpacing: 0.5,
                                  children:
                                  controller.getLeaveHistory.map((leave)=>
                                      Chip(
                                          elevation: 8,
                                          avatar: leave.leaveDetailStatus == "1" || leave.leaveDetailStatus == "7" ? CircleAvatar(
                                            backgroundColor: CommonWidget.softColor,
                                            child: const Text('P'),
                                          ): leave.leaveDetailStatus =="2"? CircleAvatar(
                                            backgroundColor: CommonWidget.primaryColor,
                                            child: const Text('A'),
                                          ): leave.leaveDetailStatus == "3"? const CircleAvatar(
                                            backgroundColor: Colors.redAccent,
                                            child: Text('R'),
                                          ):null,
                                          backgroundColor: CommonWidget.lightColor,
                                          label: Padding(
                                            padding: const EdgeInsets.all(7),
                                            child: Text("${DateFormat('MM/d/y').format(controller.parseDate(leave.leaveDate!))} ( ${_getPeriod(int.parse(leave.period??"0"))} )",
                                            ),
                                          )
                                      )
                                  ).toList(),
                                );
                              }),
                              const SizedBox(height: 20),
                              Row(children: const [
                                Text(
                                  "Overtime",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ]),
                              const SizedBox(height: 10),
                              Obx((){
                                if(controller.isOvertimeLoading){
                                  return const Center(child: CircularProgressIndicator(),);
                                }
                                if(controller.getOvertimeHistory.isEmpty){
                                  return const Center(child: Text("No overtime history."));
                                }
                                return Column(
                                  children: controller.getOvertimeHistory.map((overtime){
                                    return Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: CommonWidget.lightColor,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(5,5,10,5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor:overtime.overTimeStatus == "1" || overtime.overTimeStatus == "7" ?
                                              CommonWidget.lightColor:
                                              overtime.overTimeStatus == "2" ? CommonWidget.primaryColor:
                                              overtime.overTimeStatus == "3" ? Colors.redAccent:
                                              overtime.overTimeStatus == "4" ? CommonWidget.softColor: null,
                                              child: Text(
                                                overtime.overTimeStatus == "1" ? "P" :
                                                    overtime.overTimeStatus == "2" ? "A" :
                                                        overtime.overTimeStatus == "3" ? "R" : "P"
                                              ),
                                            ),
                                            Text(DateFormat('MM/d/y').format(controller.parseDate(overtime.appliedDate!)), overflow: TextOverflow.ellipsis, maxLines: 1,),
                                            const Text("|"),
                                            Text("${overtime.fromTime} ~ ${overtime.toTime}", overflow: TextOverflow.ellipsis, maxLines: 1,),
                                            const Text("|"),
                                            Text("${controller.timeDifference(overtime.fromTime??'00:00', overtime.toTime??'00:00')} hour", overflow: TextOverflow.ellipsis, maxLines: 1,),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              })
                              ,
                              const SizedBox(height: 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: SafeArea(
            child: Obx((){
              if(profileService.isLoading) return const Center(child: CircularProgressIndicator(),);
              return DrawerWidget(
                employeeName: profileService.employee.employeeName!,
                employeeProfile: profileService.commonImageWidget(),
              );
            }),
          ),
        );
      }
    );
  }
}
