import 'package:ems_mobile/Models/Profile/profile.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Leave/leave_service.dart';
import 'package:ems_mobile/Services/Overtime/overtime_service.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LongTermLeaveReport extends StatelessWidget {
  LongTermLeaveReport({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ProfileService profile = Get.find();
    return GetBuilder<LeaveService>(builder: (controller) {
      return Obx(
            () => controller.isLoading
            ? const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        )
            : Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          CommonWidget.commonText("Employee Id"),
                          const SizedBox(height: 5),
                          TextFormField(
                            readOnly: true,
                            initialValue: controller.leave.employeeId,
                            decoration: CommonWidget.commonInput(
                                "Employee Id", true),
                            // validator: (value) => CommonWidget.isEmpty(
                            //     value, "Employee Id"),
                            //onChanged: (value) => controller.leave.employeeName = value,
                          ),
                          const SizedBox(height: 15),
                          CommonWidget.commonText("Employee Name"),
                          const SizedBox(height: 5),
                          TextFormField(
                            readOnly: true,
                            initialValue:
                            controller.leave.employeeName,
                            decoration: CommonWidget.commonInput(
                                "Employee Name", true),
                            //validator: (value) => CommonWidget.isEmpty(value),
                            // onChanged: (value) =>
                            //     controller.leave.employeeName = value,
                          ),
                          const SizedBox(height: 15),
                          CommonWidget.commonText("Leave Type"),
                          const SizedBox(height: 5),
                          TextFormField(
                            readOnly: true,
                            decoration:
                            CommonWidget.commonInput("TBD", true),
                          ),
                          const SizedBox(height: 15),
                          CommonWidget.commonText("Request Date"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: controller.requestDateController,
                            decoration: CommonWidget.dobDecoration(
                                context,
                                "Request Date",
                                controller.requestDateController.text.isEmpty?DateTime.now():controller.requestDateController.text,
                                (datetime){
                                    controller.requestDateController.text =
                                    datetime
                                        .toString()
                                        .split(" ")[0];
                                    // DateTime.parse(controller
                                    //     .dateController.text);
                                }),
                            validator: (value) =>
                                CommonWidget.isEmpty(value, "Request Date"),
                          ),
                          const SizedBox(height: 15),
                          CommonWidget.commonText("From Date"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: controller.fromDateController,
                            decoration: CommonWidget.dobDecoration(
                                context,
                                "From Date",
                                controller.fromDateController.text.isEmpty?DateTime.now():controller.fromDateController.text,
                                    (datetime){
                                  controller.fromDateController.text =
                                  datetime
                                      .toString()
                                      .split(" ")[0];
                                  // DateTime.parse(controller
                                  //     .dateController.text);
                                }),
                            validator: (value) =>
                                CommonWidget.isEmpty(value, "From Date"),
                          ),
                          const SizedBox(height: 15),
                          CommonWidget.commonText("To Date"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: controller.toDateController,
                            decoration: CommonWidget.dobDecoration(
                                context,
                                "To Date",
                                controller.toDateController.text.isEmpty?DateTime.now():controller.toDateController.text,
                                    (datetime){
                                  controller.toDateController.text =
                                  datetime
                                      .toString()
                                      .split(" ")[0];
                                  // DateTime.parse(controller
                                  //     .dateController.text);
                                }),
                            validator: (value) =>
                                CommonWidget.isEmpty(value, "To Date"),
                          ),
                          const SizedBox(height: 15),
                          CommonWidget.commonText("Leave Reason"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: controller.leaveReasonController,
                            maxLines: 3,
                            decoration: CommonWidget.commonInput(
                                "Leave Reason", false),
                            validator: (value) => CommonWidget.isEmpty(
                                value, "Leave Reason"),
                          ),
                          const SizedBox(height: 15),
                          CommonWidget.commonText("Attach File"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: controller.attachFileController,
                            readOnly: true,
                            onTap: () async {
                              controller.attachFileController.text = await CommonWidget.pickFile(
                                  (selectedFile) {
                                    controller.leave.attachFile = selectedFile;
                                  }
                              )??"";
                            },
                            decoration: CommonWidget.commonAttachmentFile(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await controller.requestLongTermLeaveReport();
                                }
                              },
                              style: CommonWidget.secondaryButtonStyle(100),
                              child: const Text("Show"),
                            ),
                          ),
                          // const SizedBox(width: 20),
                          // Expanded(
                          //   flex: 1,
                          //   child: ElevatedButton(
                          //     onPressed: () async {
                          //       if (_formKey.currentState!.validate()) {
                          //         bool request = await controller
                          //             .overtimeRequest(false);
                          //         if (request) {
                          //           Navigator.pop(context);
                          //         }
                          //       }
                          //     },
                          //     style: CommonWidget.primaryButtonStyle(),
                          //     child: const Text("Request"),
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }


}

