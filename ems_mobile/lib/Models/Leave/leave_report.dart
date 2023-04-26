import 'dart:convert';

import 'package:ems_mobile/Models/Leave/leave.dart';
import 'package:file_picker/file_picker.dart';

class LeaveReport {
  int? leaveRecordId;
  String? employeeId;
  String? employeeName;
  String? departmentName;
  bool? delFlag;
  String? fromDate;
  String? toDate;
  String? description;
  List<Leave>? leaveReportFormList;
  PlatformFile? attachFile;

  LeaveReport.empty();


  LeaveReport({required this.leaveRecordId,
    required this.employeeId,
    required this.employeeName,
    required this.departmentName,
    required this.delFlag,
    required this.fromDate,
    required this.toDate,
    required this.description,
    required this.leaveReportFormList,
    required this.attachFile});

  Map<String, dynamic> toJson() {
    return {
      "leaveRecordId": leaveRecordId,
      "employeeId": employeeId,
      "employeeName": employeeName,
      "departmentName": departmentName,
      "delFlag": delFlag,
      "fromDate": fromDate,
      "toDate": toDate,
      "description": description,
      "leaveReportFormList": leaveReportFormList!.map((e) => e.toJson()).toList()
    };
  }
}