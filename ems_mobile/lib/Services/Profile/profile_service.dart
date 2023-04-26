import 'dart:convert';

import 'package:ems_mobile/Models/Employee/employee.dart';
import 'package:ems_mobile/Models/Profile/profile.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ems_mobile/Services/Credential/credential.dart';
import 'package:intl/intl.dart';

class ProfileService extends GetxController {
  final _loading = false.obs;
  final _isChanging = false.obs;
  var requestEmployee = Employee.empty();

  var emp = Employee.empty().obs;
  ApiService api = ApiService();

  Employee get employee => emp.value;
  bool get isLoading => _loading.value;

  ////
  final _phoneController = TextEditingController().obs;
  final _privateEmailController = TextEditingController().obs;
  final _officeEmailController = TextEditingController().obs;
  final _bankAccountController = TextEditingController().obs;
  final _bankAccountTypeController = TextEditingController().obs;
  final _contactPersonController = TextEditingController().obs;
  final _contactPersonPhoneNumberController = TextEditingController().obs;
  final _relationController = TextEditingController().obs;
  final _macAddressController = TextEditingController().obs;
  final _pcNoController = TextEditingController().obs;
  final _pcPasswordController = TextEditingController().obs;

  //history
  final _profileHistory = <Profile>[].obs;
  final _isProfileHistoryLoading = false.obs;
  Profile profileChangeDetail = Profile.empty();

  // List<String> bankAccountType = [];
  Map<String, String> bankAccountType = {
    "1": "CB Card",
    "2": "CB Account",
    "3": "KBZ Card",
    "4": "KBZ Account"
  };

  @override
  void onInit(){
    getProfile();
    super.onInit();
  }

  getProfile() async {
    _loading(true);
    if (await Credential.isLoggedIn()) {
      final response = await api.get("${Config.domainUrl}${Config.profile}");
      Map<String, dynamic> map = jsonDecode(response.body);
      emp.value = Employee.formJson(map["profileForm"]);
      _loading(false);
    }
  }

  Image commonImageWidget() => _loading.value || employee.photo?.split("/").last == "null"
      ? Image.asset("assets/images/profile.webp", width: 100, height: 100)
      : Image.network(employee.photo!, width: 100, height: 100);


  Future<String?> changeProfile(bool request) async{
    _isChanging(true);
    requestEmployee.phone = phoneController.text;
    requestEmployee.email = privateEmailController.text;
    requestEmployee.officeEmail = officeEmailController.text;
    requestEmployee.bankAccount = bankAccountController.text;
    requestEmployee.bankAccountType = bankAccountTypeController.text;
    requestEmployee.contactPerson = contactPersonController.text;
    requestEmployee.contactPhone = contactPersonPhoneNumberController.text;
    requestEmployee.relation = relationController.text;
    requestEmployee.macAddress = macAddressController.text;
    requestEmployee.pcNo = pcNoController.text;
    requestEmployee.pcPassword = pcPasswordController.text;
    _analyzeDatesBeforeChangeRequest();

    final result = await api.post("${Config.domainUrl}${ request?Config.profileChangeRequest:Config.profileChangeSave}", requestEmployee.toJson());
    requestEmployee = Employee.empty();
    _isChanging(false);
    final body = jsonDecode(result.body);

    if(result.statusCode != 200){
      return body["responseDescription"];
    }
    await fetchProfileHistory();
    return null;
  }

  void initiatedValues() {
    requestEmployee = employee;
    phoneController.text = requestEmployee.phone??"";
    privateEmailController.text = requestEmployee.email??"";
    officeEmailController.text = requestEmployee.officeEmail??"";
    bankAccountController.text = requestEmployee.bankAccount??"0000000000000000";
    bankAccountTypeController.text = requestEmployee.bankAccountType??"";
    contactPersonController.text = requestEmployee.contactPerson??"";
    contactPersonPhoneNumberController.text = requestEmployee.contactPhone??"";
    relationController.text = requestEmployee.relation??"";
    macAddressController.text = requestEmployee.macAddress??"";
    pcNoController.text = requestEmployee.pcNo??"";
    pcPasswordController.text = requestEmployee.pcPassword??"";
  }

  void _analyzeDatesBeforeChangeRequest(){
    try{
      requestEmployee.joinDate = requestEmployee.joinDate != null ? DateFormat("dd/MM/yyyy").parse(requestEmployee.joinDate!).toString().split(" ")[0]:null;
      requestEmployee.positionStartDate = requestEmployee.positionStartDate != null ? DateFormat("dd/MM/yyyy").parse(requestEmployee.positionStartDate!).toString().split(" ")[0]:null;
      requestEmployee.signOutDate = requestEmployee.signOutDate != null ? DateFormat("dd/MM/yyyy").parse(requestEmployee.signOutDate!).toString().split(" ")[0]:null;
    } catch (e) {
      return;
    }
  }

  Future<bool> fetchProfileHistory() async{
    _isProfileHistoryLoading(true);
    final response = await api.get("${Config.domainUrl}${Config.profileChangeHistory}");
    _isProfileHistoryLoading(false);
    if(response.statusCode != 200){
      return false;
    }
    final body = jsonDecode(response.body);
    final list = body["profileChangeHistoryList"] as List<dynamic>;
    _profileHistory.value = list.map((e) => Profile.fromJson(e)).toList();
    return true;
  }

  TextEditingController get pcPasswordController => _pcPasswordController.value;

  TextEditingController get pcNoController => _pcNoController.value;

  TextEditingController get macAddressController => _macAddressController.value;

  TextEditingController get relationController => _relationController.value;

  TextEditingController get contactPersonPhoneNumberController => _contactPersonPhoneNumberController.value;

  TextEditingController get contactPersonController => _contactPersonController.value;

  TextEditingController get bankAccountTypeController => _bankAccountTypeController.value;

  TextEditingController get bankAccountController => _bankAccountController.value;

  TextEditingController get officeEmailController => _officeEmailController.value;

  TextEditingController get privateEmailController => _privateEmailController.value;

  TextEditingController get phoneController => _phoneController.value;

  bool get isChanging => _isChanging.value;

  List<Profile> get profileHistory => _profileHistory.value;

  bool get isProfileHistoryLoading => _isProfileHistoryLoading.value;

}
