import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Overtime/overtime_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LongTermLeaveReport extends StatefulWidget {
  const LongTermLeaveReport({super.key});

  @override
  State<LongTermLeaveReport> createState() => _LongTermLeaveReportState();
}

class _LongTermLeaveReportState extends State<LongTermLeaveReport> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OvertimeService>(builder: (controller) {
      controller.overtimeRegister();
      return Obx(
        () => controller.isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(title: const Text("Long Term Leave Report")),
                body: Container(
                  decoration: CommonWidget.commonBackground(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              CommonWidget.commonText("Employee Id"),
                              const SizedBox(height: 5),
                              TextFormField(
                                readOnly: true,
                                initialValue: controller.overtime.employeeId,
                                decoration: CommonWidget.commonInput(
                                    "Employee Id", true),
                              ),
                              const SizedBox(height: 15),
                              CommonWidget.commonText("Employee Name"),
                              const SizedBox(height: 5),
                              TextFormField(
                                readOnly: true,
                                initialValue: controller.overtime.employeeName,
                                decoration: CommonWidget.commonInput(
                                    "Employee Name", true),
                              ),
                              const SizedBox(height: 15),
                              CommonWidget.commonText("Leave Type"),
                              const SizedBox(height: 5),
                              TextFormField(
                                readOnly: true,
                                initialValue: controller.overtime.employeeName,
                                decoration:
                                    CommonWidget.commonInput("TBD", true),
                                onChanged: (value) =>
                                    controller.overtime.appliedDate = value,
                              ),
                              const SizedBox(height: 15),
                              CommonWidget.commonText("Request Date"),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: controller.dateController,
                                decoration: CommonWidget.dobDecoration(
                                    context,
                                    "Request Date",
                                    controller.dateController.text,
                                    (datetime) => {
                                          setState(() {
                                            controller.dateController.text =
                                                datetime
                                                    .toString()
                                                    .split(" ")[0];
                                            controller.overtime.appliedDate =
                                                controller.dateController.text;
                                          })
                                        }),
                                validator: (value) =>
                                    CommonWidget.isEmpty(value, "Request Date"),
                                onChanged: (v) {
                                  controller.overtime.appliedDate = v;
                                },
                              ),
                              const SizedBox(height: 15),
                              CommonWidget.commonText("From Date"),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: controller.dateController,
                                decoration: CommonWidget.dobDecoration(
                                    context,
                                    "From Date",
                                    controller.dateController.text,
                                    (datetime) => {
                                          setState(() {
                                            controller.dateController.text =
                                                datetime
                                                    .toString()
                                                    .split(" ")[0];
                                            controller.overtime.appliedDate =
                                                controller.dateController.text;
                                          })
                                        }),
                                validator: (value) =>
                                    CommonWidget.isEmpty(value, "From Date"),
                                onChanged: (v) {
                                  controller.overtime.appliedDate = v;
                                },
                              ),
                              const SizedBox(height: 15),
                              CommonWidget.commonText("To Date"),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: controller.dateController,
                                decoration: CommonWidget.dobDecoration(
                                    context,
                                    "To Date",
                                    controller.dateController.text,
                                    (datetime) => {
                                          setState(() {
                                            controller.dateController.text =
                                                datetime
                                                    .toString()
                                                    .split(" ")[0];
                                            controller.overtime.appliedDate =
                                                controller.dateController.text;
                                          })
                                        }),
                                validator: (value) =>
                                    CommonWidget.isEmpty(value, "To Date"),
                                onChanged: (v) {
                                  controller.overtime.appliedDate = v;
                                },
                              ),
                              const SizedBox(height: 15),
                              CommonWidget.commonText("Leave Reason"),
                              const SizedBox(height: 5),
                              TextFormField(
                                initialValue: controller.overtime.description,
                                maxLines: 3,
                                decoration: CommonWidget.commonInput(
                                    "Leave Reason", false),
                                validator: (value) =>
                                    CommonWidget.isEmpty(value, "Leave Reason"),
                                onChanged: (value) =>
                                    controller.overtime.description = value,
                              ),
                              const SizedBox(height: 15),
                              CommonWidget.commonText("Attach File"),
                              const SizedBox(height: 5),
                              TextFormField(
                                readOnly: true,
                                onTap: () async {
                                  await CommonWidget.pickFile();
                                },
                                initialValue: "",
                                decoration: CommonWidget.commonAttachmentFile(),
                                onChanged: (value) =>
                                    controller.overtime.appliedDate = value,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        bool request = await controller
                                            .overtimeRequest(true);
                                        if (request) {
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        }
                                      }
                                    },
                                    style: CommonWidget.secondaryButtonStyle(),
                                    child: const Text("Show"),
                                  ),
                                ),
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
