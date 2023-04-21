import 'dart:convert';

import 'package:ems_mobile/Models/Leave/leave.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:get/get.dart';

class LeaveService extends GetxController {
  RxList<Leave> leave = RxList<Leave>([]);
  ApiService api = ApiService();

  getLeave() async {
    final response = await api.get("${Config.domainUrl}${Config.leaveHistory}");
    Map<String, dynamic> map = jsonDecode(response.body);
    leave.value = RxList<Leave>.from(
        (map["leaveRecordHistory"] as List).map((x) => Leave.fromJson(x)));
    print(leave.value);
  }
}
