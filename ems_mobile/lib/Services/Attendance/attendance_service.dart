import 'dart:convert';

import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:ems_mobile/Models/Attendance/attendance.dart';
import 'package:get/get.dart';

class AttendanceService extends GetxController {
  RxList<Attendance> attendances = RxList<Attendance>([]);
  RxMap<String, dynamic> status = RxMap<String, dynamic>();
  ApiService api = ApiService();

  getAttendance() async {
    final response =
        await api.get("${Config.domainUrl}${Config.attendanceHistory}");
    Map<String, dynamic> map = jsonDecode(response.body);
    var test=
        (map["wfhHistory"] as List).map((x) => Attendance.fromJson(x));
        print(test);
    attendances.value = RxList<Attendance>.from(
        (map["wfhHistory"] as List).map((x) => Attendance.fromJson(x)));
    status.value = map["listStatus"] as Map<String, dynamic>;
  }

  deleteAttendance(int id) async {
    await api.post(
        "${Config.domainUrl}${Config.deleteAttendance}", {"attendanceId": id});
    await getAttendance();
  }
}
