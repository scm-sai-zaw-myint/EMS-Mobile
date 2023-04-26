import 'dart:convert';

import 'package:ems_mobile/Models/Leave/leave.dart';
import 'package:ems_mobile/Models/Leave/leave_report.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LeaveService extends GetxController {
  final _loading = false.obs;
  RxList<Leave> leaves = RxList<Leave>([]);
  RxMap<String, dynamic> remainLeave = RxMap<String, dynamic>();
  RxMap<String, dynamic> status = RxMap<String, dynamic>();
  ApiService api = ApiService();
  bool get isLoading => _loading.value;

  final _isLoading = false.obs;
  final _requestDateController = TextEditingController().obs;
  final _fromDateController = TextEditingController().obs;
  final _toDateController = TextEditingController().obs;
  final _leaveReasonController = TextEditingController().obs;
  final _attachFileController = TextEditingController().obs;

  LeaveReport leave = LeaveReport.empty();

  getLeave() async {
    _loading(true);
    final response = await api.get("${Config.domainUrl}${Config.leaveHistory}");
    Map<String, dynamic> map = jsonDecode(response.body);
    leaves.value = RxList<Leave>.from(
        (map["leaveRecordHistory"] as List).map((x) => Leave.fromJson(x)));
    remainLeave.value = map["remainLeaves"] as Map<String, dynamic>;
    status.value = map["status"] as Map<String, dynamic>;
    _loading(false);
  }

  showLongThermLeaveReport(){
    DateTime fromDate = DateTime.parse(fromDateController.text);
    DateTime toDate = DateTime.parse(toDateController.text);
    DateTime requestDate = DateTime.parse(requestDateController.text);
    leave.fromDate = "${fromDate.day}/${fromDate.month}/${fromDate.year}";
    leave.toDate = "${toDate.day}/${toDate.month}/${toDate.year}";
    leave.description = leaveReasonController.text;
    final diff = toDate.difference(fromDate);
    List<Leave> leaveList = [];
    for(int i = 0; i < diff.inDays;i++) {
      Leave dayLeave = Leave.empty();
      dayLeave.date = "${requestDate.day}/${requestDate.month}/${requestDate.year}";
      dayLeave.period = "3";
      dayLeave.description = leaveReasonController.text;
      leaveList.add(dayLeave);
    }
    leave.leaveReportFormList = leaveList;
  }

  Future<bool> requestLongTermLeaveReport() async {
    showLongThermLeaveReport();
    // final requestData = {
    //   'leaveReportDetail': leave
    // };
    final requestData = leave.toJson();
    final response = await api.multipartRequest("${Config.domainUrl}${Config.longLeaveRequest}", requestData, leave.attachFile);
    print("I am here with the following" + jsonEncode(response!.body));
    return true;
  }

  bool get isLoading => _isLoading.value;

  TextEditingController get attachFileController => _attachFileController.value;

  TextEditingController get leaveReasonController => _leaveReasonController.value;

  TextEditingController get toDateController => _toDateController.value;

  TextEditingController get fromDateController => _fromDateController.value;

  TextEditingController get requestDateController => _requestDateController.value;
}
