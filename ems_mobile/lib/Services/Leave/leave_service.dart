import 'dart:convert';

import 'package:ems_mobile/Models/Leave/leave.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:get/get.dart';

class LeaveService extends GetxController {
  final _loading = false.obs;
  RxList<Leave> leaves = RxList<Leave>([]);
  RxMap<String, dynamic> remainLeave = RxMap<String, dynamic>();
  RxMap<String, dynamic> status = RxMap<String, dynamic>();
  RxMap<String, dynamic> period = RxMap<String, dynamic>();
  ApiService api = ApiService();
  bool get isLoading => _loading.value;

    @override
  void onInit() {
    getLeave();
    super.onInit();
  }

  getLeave() async {
    _loading(true);
    final response = await api.get("${Config.domainUrl}${Config.leaveHistory}");
    Map<String, dynamic> map = jsonDecode(response.body);
    leaves.value = RxList<Leave>.from(
        (map["leaveRecordHistory"] as List).map((x) => Leave.fromJson(x)));
    remainLeave.value = map["remainLeaves"] as Map<String, dynamic>;
    status.value = map["status"] as Map<String, dynamic>;
    period.value = map["period"] as Map<String, dynamic>;
    _loading(false);
  }

  registerSingleLeave(bool request, Leave leave) async {
    String type = request ? "?request" : "?save";
    print("${Config.domainUrl}${Config.singleLeaveRequest}$type");
    final response = await api.post(
        "${Config.domainUrl}${Config.singleLeaveRequest}$type",
        {"leaveReportDetail": leave});
    Map<String, dynamic> map = jsonDecode(response.body);
    print(map);
  }
}
