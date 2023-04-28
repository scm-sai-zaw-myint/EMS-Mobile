import 'package:ems_mobile/Models/Leave/leave.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Leave/leave_service.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleLeaveReport extends StatefulWidget {
  const SingleLeaveReport({super.key});

  @override
  State<SingleLeaveReport> createState() => _SingleLeaveReportState();
}

class _SingleLeaveReportState extends State<SingleLeaveReport> {
  Leave leave = Leave.empty();
  final _formKey = GlobalKey<FormState>();
  final _empIdController = TextEditingController();
  final _empNameController = TextEditingController();
  final _typeController = TextEditingController();
  final _dateController = TextEditingController();
  final _reasonController = TextEditingController();
  String periodValue = "";
  List<String> periodList = [];

  @override
  void initState() {
    super.initState();
    ProfileService profileService = Get.find();
    profileService.getProfile();
    LeaveService leaveService = Get.find();
    leaveService.getLeave();
    periodList =
        leaveService.period.values.toList().map((e) => e.toString()).toList();
    _empIdController.text = profileService.employee.employeeId!;
    _empNameController.text = profileService.employee.employeeName!;
    _typeController.text = "TBD";
    leave.employeeId = _empIdController.text;
    leave.employeeName = _empNameController.text;
    leave.leaveType = _typeController.text;
    periodValue = periodList.first;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveService>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: const Text("Single Leave Report")),
        body: Container(
          decoration: CommonWidget.commonBackground(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        controller: _empIdController,
                        decoration:
                            CommonWidget.commonInput("Employee Id", true),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "Employee Id"),
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Employee Name"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _empNameController,
                        decoration:
                            CommonWidget.commonInput("Employee Name", true),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "Employee Name"),
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Leave Type"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _typeController,
                        decoration:
                            CommonWidget.commonInput("Leave Type", true),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "Leave Type"),
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Leave Date"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _dateController,
                        decoration: CommonWidget.dobDecoration(
                            context,
                            "Leave Date",
                            _dateController.text,
                            (datetime) => {
                                  setState(() {
                                    _dateController.text =
                                        CommonWidget.YMDtoDMY(
                                            datetime.toString().split(" ")[0]);
                                    leave.leaveDate = _dateController.text;
                                  })
                                }),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "Leave Date"),
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Period"),
                      const SizedBox(height: 5),
                      DropdownButtonFormField<String>(
                        decoration: CommonWidget.commonInput("Period", false),
                        isExpanded: true,
                        value: periodValue,
                        items: periodList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            periodValue = newValue!;
                            leave.period = periodValue;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Leave Reason"),
                      const SizedBox(height: 5),
                      TextFormField(
                          controller: _reasonController,
                          maxLines: 3,
                          decoration:
                              CommonWidget.commonInput("Leave Reason", false),
                          validator: (value) =>
                              CommonWidget.isEmpty(value, "Leave Reason"),
                          onChanged: (value) =>
                              leave.description = _reasonController.text),
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
                                await controller.registerSingleLeave(
                                    false, leave);
                              }
                            },
                            style: CommonWidget.primaryButtonStyle(),
                            child: const Text("Save"),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await controller.registerSingleLeave(
                                    false, leave);
                              }
                              // if (_formKey.currentState!.validate()) {
                              //   DateTime now = DateTime.now();
                              //   DateTime fromTime = DateTime(
                              //       now.year,
                              //       now.month,
                              //       now.day,
                              //       int.parse(
                              //           _fromTimeController.text.split(":")[0]),
                              //       int.parse(_fromTimeController.text
                              //           .split(":")[1]));
                              //   DateTime toTime = DateTime(
                              //       now.year,
                              //       now.month,
                              //       now.day,
                              //       int.parse(
                              //           _toTimeController.text.split(":")[0]),
                              //       int.parse(
                              //           _toTimeController.text.split(":")[1]));
                              //   List<String> dmy1 = CommonWidget.DMYtoYMD(
                              //           _fromDateController.text)
                              //       .split("-");
                              //   DateTime fromDate = DateTime(int.parse(dmy1[0]),
                              //       int.parse(dmy1[1]), int.parse(dmy1[2]));
                              //   List<String> dmy2 = CommonWidget.DMYtoYMD(
                              //           _toDateController.text)
                              //       .split("-");
                              //   DateTime toDate = DateTime(int.parse(dmy2[0]),
                              //       int.parse(dmy2[1]), int.parse(dmy2[2]));
                              //   if (fromDate.compareTo(toDate) > 0) {
                              //     showDialog(
                              //         context: context,
                              //         builder: (BuildContext context) {
                              //           return CommonWidget.errorAlert(
                              //               "From Date must be earlier than To Date");
                              //         });
                              //   } else if (fromTime.isAfter(toTime)) {
                              //     showDialog(
                              //         context: context,
                              //         builder: (BuildContext context) {
                              //           return CommonWidget.errorAlert(
                              //               "From Time must be earlier than To Time");
                              //         });
                              //   } else {
                              //     controller.getAttendance();
                              //     for (Attendance att
                              //         in controller.attendances) {
                              //       if (att.activeFlag == "1") {
                              //         if (DateTime.parse(CommonWidget.DMYtoYMD(att.recordDate!)).isAfter(DateTime.parse(
                              //                     CommonWidget.DMYtoYMD(
                              //                         _fromDateController.text))
                              //                 .subtract(
                              //                     const Duration(days: 1))) &&
                              //             DateTime.parse(CommonWidget.DMYtoYMD(att.recordDate!))
                              //                 .isBefore(DateTime.parse(
                              //                         CommonWidget.DMYtoYMD(
                              //                             _toDateController.text))
                              //                     .add(const Duration(days: 1)))) {
                              //           duplicate.add(att.recordDate!);
                              //         }
                              //       }
                              //     }
                              //     if (duplicate.isEmpty) {
                              //       controller.registerAttendance(
                              //           attendance,
                              //           _fromDateController.text,
                              //           _toDateController.text);
                              //       Get.to(() => const AttendanceHistory());
                              //     } else {
                              //       showDialog(
                              //           context: context,
                              //           builder: (BuildContext context) {
                              //             return CommonWidget.errorAlert(
                              //                 "${duplicate.reversed.toList()} \n\nDates should not be duplicate");
                              //           }).then((value) => duplicate.clear());
                              //     }
                              //   }
                              // }
                            },
                            style: CommonWidget.primaryButtonStyle(),
                            child: const Text("Register"),
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
      );
    });
  }
}
