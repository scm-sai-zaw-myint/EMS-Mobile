import 'dart:convert';

import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:ems_mobile/Models/Attendance/attendance.dart';
import 'package:get/get.dart';

class AttendanceService extends GetxController {
  RxList<Attendance> attendances = RxList<Attendance>([]);
  RxMap<String, dynamic> status = RxMap<String, dynamic>();
  RxMap<String, dynamic> attendanceTypeMap = RxMap<String, dynamic>();
  List<String> attendanceTypeList = List.empty();
  ApiService api = ApiService();

  registerAttendance(
      Attendance attendance, String fromDate, String toDate) async {
    List<String> fDate = CommonWidget.DMYtoYMD(fromDate).split("-");
    List<String> tDate = CommonWidget.DMYtoYMD(toDate).split("-");
    DateTime startDate =
        DateTime(int.parse(fDate[0]), int.parse(fDate[1]), int.parse(fDate[2]));
    DateTime endDate =
        DateTime(int.parse(tDate[0]), int.parse(tDate[1]), int.parse(tDate[2]));
    List<DateTime> weekdays =
        CommonWidget.getWeekdaysBetweenDates(startDate, endDate);
    List<Map<String, dynamic>> wfhRegisterFormList = [];

    for (DateTime days in weekdays) {
      Map<String, dynamic> wfhRegisterForm = {
        "recordDate": CommonWidget.YMDtoDMY(days.toString().split(" ")[0]),
        "fromTime": attendance.arrivalTime,
        "toTime": attendance.leaveTime,
        "isWFH": false,
        "description": ""
      };
      wfhRegisterFormList.add(wfhRegisterForm);
      attendances.add(Attendance());
    }
    await api.post(
        "${Config.domainUrl}${Config.registerAttendance}",
        {"wfhRegisterFormList": wfhRegisterFormList});
  }

  getAttendance() async {
    final response =
        await api.get("${Config.domainUrl}${Config.attendanceHistory}");
    Map<String, dynamic> map = jsonDecode(response.body);
    attendances.value = RxList<Attendance>.from(
        (map["wfhHistory"] as List).map((x) => Attendance.fromJson(x)));
    status.value = map["listStatus"] as Map<String, dynamic>;
    attendanceTypeMap.value = map["listAttendanceType"] as Map<String, dynamic>;
    attendanceTypeList = attendanceTypeMap.values
        .toList()
        .map((e) => e.toString())
        .toList()
      ..removeAt(0);
  }

  updateAttendance(Attendance attendance, String type, String status) async {
    attendance.wfhFlag = type == "Office" ? "0" : "1";
    attendance.wfhStatus = status == "Save" ? "4" : "1";
    if (attendance.wfhFlag == null) {
      attendance.wfhStatus = null;
    }
        await api.post("${Config.domainUrl}${Config.editAttendance}", {
      "attendanceRecordId": attendance.attendanceRecordId,
      "employeeId": attendance.employeeId,
      "employeeName": attendance.employeeName,
      "recordDate": attendance.recordDate,
      "fromTime": attendance.arrivalTime,
      "toTime": attendance.leaveTime,
      "wfhStatus": attendance.wfhStatus,
      "description": attendance.description,
      "wfhflag": attendance.wfhFlag
    });
  }

  deleteAttendance(int id) async {
    await api.post(
        "${Config.domainUrl}${Config.deleteAttendance}", {"attendanceId": id});
    await getAttendance();
  }
}
