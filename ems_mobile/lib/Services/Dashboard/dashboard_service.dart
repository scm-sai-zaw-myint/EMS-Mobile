import 'dart:convert';

import 'package:ems_mobile/Models/Attendance/attendance.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardService extends GetxController {
  final _isLoading = false.obs;
  final _attendanceList = <Attendance>[].obs;
  ApiService api = ApiService();

  bool get isLoading => _isLoading.value;

  List<Attendance> get getAttendanceList => _attendanceList.value;

  @override
  void onInit() {
    getAttendanceData(DateTime.now());
    super.onInit();
  }

  int attendanceRecord(int day) {
    Map<String, bool> data = {};
    Attendance? attendance = getAttendanceList.firstWhereOrNull(
        (element) => DateTime.parse(element.recordDate!).day == day);
    if(attendance == null) return 0;
    data["noReport"] = attendance.arrivalTime == null && attendance.leaveTime == null;
    data["attendance"] = !data["noReport"]!;
    data["isWFH"] = attendance.wfhFlag == "1";
    data["isLeave"] = attendance.offDayFlag == "1";
    return 0;
  }

  Future<bool> getAttendanceData(DateTime dateTime) async {
    _isLoading(true);
    DateTime fromDate = DateTime(dateTime.year, dateTime.month, 1);
    DateTime toDate = DateTime(dateTime.year, dateTime.month + 1, 0);
    final response = await api.post(
        "${Config.domainUrl}${Config.attendanceData}?offset=1&limit=31&search=true",
        {
          "fromDate": DateFormat("d/MM/y").format(fromDate),
          "toDate": DateFormat("d/MM/y").format(toDate),
          "attendanceType": 0
        });
    if (response.statusCode != 200) {
      return false;
    }
    Map<String, dynamic> body = jsonDecode(response.body);
    final listBody = body["wfhHistory"] as List<dynamic>;
    _attendanceList.value =
        listBody.map((e) => Attendance.fromJson(e)).toList().reversed.toList();
    _isLoading(false);
    return true;
  }
}
