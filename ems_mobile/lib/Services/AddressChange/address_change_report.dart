import 'dart:convert';

import 'package:ems_mobile/Models/AddressChange/address_change.dart';
import 'package:ems_mobile/Models/Overtime/overtime_model.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressChangeService extends GetxController {
  RxList<AddressChange> addressChange = RxList<AddressChange>([]);
  ApiService api = ApiService();
  List<String> list = ["a", "b"];
  // final _overtime = Overtime.empty().obs;
  final _dateController = TextEditingController().obs;
  final _otHourController = TextEditingController().obs;
  var _isloading = false.obs;

  TextEditingController get dateController => _dateController.value;
  TextEditingController get otHourController => _otHourController.value;
  // Overtime get overtime => _overtime.value;
  bool get isLoading => _isloading.value;

  Future<void> overtimeRegister() async {
    _dateController.value.text = DateTime.now().toString().split(" ")[0];
    // _overtime.value.appliedDate = DateTime.now().toString().split(" ")[0];
    _isloading(true);
    final response =
        await api.get("${Config.domainUrl}${Config.overtimeRegist}");
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // _overtime.value = Overtime.fromJson(jsonResponse["overtimeRequest"]);
    // if ((fromTime != null && toTime != null) &&
    //     (fromTime != "" && toTime != "")) {
    //   String fTime =
    //       (double.parse(fromTime.split(":")[1]) / 60).toString().split(".")[1];
    //   String tTime =
    //       (double.parse(toTime.split(":")[1]) / 60).toString().split(".")[1];

    //   double timeFrom = double.parse("${fromTime.split(":")[0]}.$fTime");
    //   double timeTo = double.parse("${toTime.split(":")[0]}.$tTime");
    //   _otHourController.value.text = (timeTo - timeFrom).toString();
    // } else {
    //   _otHourController.value.text = "0.0";
    // }
    _isloading(false);
  }

  // Future<bool> overtimeRequest(isSave) async {
  //   var param = isSave ? "save" : "request";
  //   final response = await api.post(
  //       "${Config.domainUrl}${Config.overtimeRegist}?request=$param",
  //       Overtime.toJson(overtime));
  //   if (response.statusCode == 200) return true;
  //   return false;
  // }

  getLeave() async {
    final response = await api.get("${Config.domainUrl}${Config.leaveHistory}");
    Map<String, dynamic> map = jsonDecode(response.body);
    addressChange.value = RxList<AddressChange>.from(
        (map["AddressChangeHistory"] as List)
            .map((x) => AddressChange.fromJson(x)));
    print(addressChange.value);
  }
}
