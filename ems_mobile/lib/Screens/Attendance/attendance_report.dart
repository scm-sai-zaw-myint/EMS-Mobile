import 'package:ems_mobile/Models/Attendance/attendance.dart';
import 'package:ems_mobile/Screens/Attendance/attendance_history.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Attendance/attendance_service.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceReport extends StatefulWidget {
  const AttendanceReport({super.key});

  @override
  State<AttendanceReport> createState() => _AttendanceReportState();
}

class _AttendanceReportState extends State<AttendanceReport> {
  Attendance attendance = Attendance.empty();
  final _formKey = GlobalKey<FormState>();
  final _empIdController = TextEditingController();
  final _empNameController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  final _fromTimeController = TextEditingController();
  final _toTimeController = TextEditingController();
  List<String> duplicate = [];
  @override
  void initState() {
    super.initState();

    ProfileService profileService = Get.find();
    profileService.getProfile();
    _empIdController.text = profileService.employee.employeeId!;
    _empNameController.text = profileService.employee.employeeName!;
    attendance.employeeId = _empIdController.text;
    attendance.employeeName = _empNameController.text;
    _fromTimeController.text = "08:00";
    _toTimeController.text = "17:00";
    attendance.arrivalTime = _fromTimeController.text;
    attendance.leaveTime = _toTimeController.text;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceService>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: const Text("Attendance Report")),
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
                      CommonWidget.commonText("From Date"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _fromDateController,
                        decoration: CommonWidget.dobDecoration(
                            context,
                            "From Date",
                            _fromDateController.text,
                            (datetime) => {
                                  setState(() {
                                    _fromDateController.text =
                                        CommonWidget.YMDtoDMY(
                                            datetime.toString().split(" ")[0]);
                                  })
                                }),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "From Date"),
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("To Date"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _toDateController,
                        decoration: CommonWidget.dobDecoration(
                            context,
                            "To Date",
                            _toDateController.text,
                            (datetime) => {
                                  setState(() {
                                    _toDateController.text =
                                        CommonWidget.YMDtoDMY(
                                            datetime.toString().split(" ")[0]);
                                  })
                                }),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "To Date"),
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("From Time"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _fromTimeController,
                        decoration: CommonWidget.timeInput(
                            context,
                            "From Time",
                            (time) => {
                                  setState(() {
                                    _fromTimeController.text =
                                        "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
                                    attendance.arrivalTime =
                                        _fromTimeController.text;
                                  }),
                                },
                            CommonWidget.getTimeOfDayFromString(
                                _fromTimeController.text)),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "From Time"),
                        onChanged: (v) {
                          attendance.arrivalTime = v;
                          _fromTimeController.text = v;
                        },
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("To Time"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _toTimeController,
                        decoration: CommonWidget.timeInput(
                            context,
                            "To Time",
                            (time) => {
                                  setState(() {
                                    _toTimeController.text =
                                        "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
                                    attendance.leaveTime =
                                        _toTimeController.text;
                                  }),
                                },
                            CommonWidget.getTimeOfDayFromString(
                                _toTimeController.text)),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "To Time"),
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                DateTime now = DateTime.now();
                                DateTime fromTime = DateTime(
                                    now.year,
                                    now.month,
                                    now.day,
                                    int.parse(
                                        _fromTimeController.text.split(":")[0]),
                                    int.parse(_fromTimeController.text
                                        .split(":")[1]));
                                DateTime toTime = DateTime(
                                    now.year,
                                    now.month,
                                    now.day,
                                    int.parse(
                                        _toTimeController.text.split(":")[0]),
                                    int.parse(
                                        _toTimeController.text.split(":")[1]));
                                List<String> dmy1 = CommonWidget.DMYtoYMD(
                                        _fromDateController.text)
                                    .split("-");
                                DateTime fromDate = DateTime(int.parse(dmy1[0]),
                                    int.parse(dmy1[1]), int.parse(dmy1[2]));
                                List<String> dmy2 = CommonWidget.DMYtoYMD(
                                        _toDateController.text)
                                    .split("-");
                                DateTime toDate = DateTime(int.parse(dmy2[0]),
                                    int.parse(dmy2[1]), int.parse(dmy2[2]));
                                if (fromDate.compareTo(toDate) > 0) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CommonWidget.errorAlert(
                                            "From Date must be earlier than To Date");
                                      });
                                } else if (fromTime.isAfter(toTime)) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CommonWidget.errorAlert(
                                            "From Time must be earlier than To Time");
                                      });
                                } else {
                                  controller.getAttendance();
                                  for (Attendance att
                                      in controller.attendances) {
                                    if (att.activeFlag == "1") {
                                      if (DateTime.parse(CommonWidget.DMYtoYMD(att.recordDate!)).isAfter(DateTime.parse(
                                                  CommonWidget.DMYtoYMD(
                                                      _fromDateController.text))
                                              .subtract(
                                                  const Duration(days: 1))) &&
                                          DateTime.parse(CommonWidget.DMYtoYMD(att.recordDate!))
                                              .isBefore(DateTime.parse(
                                                      CommonWidget.DMYtoYMD(
                                                          _toDateController.text))
                                                  .add(const Duration(days: 1)))) {
                                        duplicate.add(att.recordDate!);
                                      }
                                    }
                                  }
                                  if (duplicate.isEmpty) {
                                    controller.registerAttendance(
                                        attendance,
                                        _fromDateController.text,
                                        _toDateController.text);
                                    Get.to(() => const AttendanceHistory());
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CommonWidget.errorAlert(
                                              "${duplicate.reversed.toList()} \n\nDates should not be duplicate");
                                        }).then((value) => duplicate.clear());
                                  }
                                }
                              }
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
