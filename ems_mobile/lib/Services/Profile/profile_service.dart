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
  var requestEmployee = Profile.empty();
  final _isUpdate = false.obs;

  var emp = Employee.empty().obs;
  ApiService api = ApiService();

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
  void onInit() {
    getProfile();
    super.onInit();
  }

  getProfile() async {
    if (await Credential.isLoggedIn()) {
      _loading(true);
      final response = await api.get("${Config.domainUrl}${Config.profile}");
      Map<String, dynamic> map = jsonDecode(response.body);
      emp.value = Employee.formJson(map["profileForm"]);
      _loading(false);
    }
  }

  Image commonImageWidget() => _loading.value ||
          employee.photo?.split("/").last == "null"
      ? Image.asset("assets/images/img_profile.jpg", width: 100, height: 100)
      : Image.network(employee.photo!, width: 100, height: 100);

  Future<String?> changeProfile(bool request) async {
    _isChanging(true);
    setRequestEmployee = employee;
    print(requestEmployee.toJson());
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
    String requestURL = isUpdate
        ? Config.profileChangeEdit
        : request
            ? Config.profileChangeRequest
            : Config.profileChangeSave;
    final result = await api.post(
        "${Config.domainUrl}$requestURL", requestEmployee.toJson());
    requestEmployee = Profile.empty();
    _isChanging(false);
    final body = jsonDecode(result.body);

    if (result.statusCode != 200) {
      return body["responseDescription"];
    }
    if (isUpdate) {
      getProfile();
      _isUpdate(false);
    }
    await fetchProfileHistory();
    return null;
  }

  void initiatedValues() {
    if (!isUpdate) setRequestEmployee = employee;

    phoneController.text = requestEmployee.phone ?? "";
    privateEmailController.text = requestEmployee.email ?? "";
    officeEmailController.text = requestEmployee.officeEmail ?? "";
    bankAccountController.text =
        requestEmployee.bankAccount ?? "0000000000000000";
    bankAccountTypeController.text = requestEmployee.bankAccountType ?? "";
    contactPersonController.text = requestEmployee.contactPerson ?? "";
    contactPersonPhoneNumberController.text =
        requestEmployee.contactPhone ?? "";
    relationController.text = requestEmployee.relation ?? "";
    macAddressController.text = requestEmployee.macAddress ?? "";
    pcNoController.text = requestEmployee.pcNo ?? "";
    pcPasswordController.text = requestEmployee.pcPassword ?? "";
  }

  void _analyzeDatesBeforeChangeRequest() {
    try {
      requestEmployee.joinDate = requestEmployee.joinDate != null
          ? DateFormat("dd/MM/yyyy")
              .parse(requestEmployee.joinDate!)
              .toString()
              .split(" ")[0]
          : null;
      requestEmployee.positionStartDate =
          requestEmployee.positionStartDate != null
              ? DateFormat("dd/MM/yyyy")
                  .parse(requestEmployee.positionStartDate!)
                  .toString()
                  .split(" ")[0]
              : null;
      requestEmployee.signOutDate = requestEmployee.signOutDate != null
          ? DateFormat("dd/MM/yyyy")
              .parse(requestEmployee.signOutDate!)
              .toString()
              .split(" ")[0]
          : null;
    } catch (e) {
      return;
    }
  }

  Future<bool> fetchProfileHistory() async {
    _isProfileHistoryLoading(true);
    final response =
        await api.get("${Config.domainUrl}${Config.profileChangeHistory}");
    _isProfileHistoryLoading(false);
    if (response.statusCode != 200) {
      return false;
    }
    final body = jsonDecode(response.body);
    final list = body["profileChangeHistoryList"] as List<dynamic>;
    _profileHistory.value = list.map((e) => Profile.fromJson(e)).toList();
    return true;
  }

  Employee get employee => emp.value;

  set setEmployeeFromProfile(Profile e) {
    emp.value.employeeId = e.employeeId;
    emp.value.employeeName = e.employeeName;
    emp.value.position = e.position;
    emp.value.email = e.email;
    emp.value.officeEmail = e.officeEmail;
    emp.value.bankAccount = e.bankAccount;
    emp.value.bankAccountType = e.bankAccountType;
    emp.value.contactPerson = e.contactPerson;
    emp.value.contactPhone = e.contactPhone;
    emp.value.relation = e.relation;
    emp.value.macAddress = e.macAddress;
    emp.value.pcNo = e.pcNo;
    emp.value.pcPassword = e.pcPassword;
  }

  set setRequestEmployee(Employee e) {
    requestEmployee.employeeId = e.employeeId;
    requestEmployee.employeeName = e.employeeName;
    requestEmployee.position = e.position;
    requestEmployee.phone = e.phone;
    requestEmployee.email = e.email;
    requestEmployee.officeEmail = e.officeEmail;
    requestEmployee.bankAccount = e.bankAccount;
    requestEmployee.bankAccountType = e.bankAccountType;
    requestEmployee.contactPerson = e.contactPerson;
    requestEmployee.contactPhone = e.contactPhone;
    requestEmployee.relation = e.relation;
    requestEmployee.macAddress = e.macAddress;
    requestEmployee.pcNo = e.pcNo;
    requestEmployee.pcPassword = e.pcPassword;
    requestEmployee.nrcDob = e.nrcDob;
    requestEmployee.dateOfBirth = e.dateOfBirth;
    requestEmployee.graduateDegree = e.graduateDegree ?? "-";
    requestEmployee.graduateUniversity = e.graduateUniversity ?? "-";
    requestEmployee.jlpt = e.jlpt;
    requestEmployee.nrc = e.nrc;
    requestEmployee.religion = e.religion;
    requestEmployee.maritalStatus = e.maritalStatus;
  }

  bool get isLoading => _loading.value;

  TextEditingController get pcPasswordController => _pcPasswordController.value;

  TextEditingController get pcNoController => _pcNoController.value;

  TextEditingController get macAddressController => _macAddressController.value;

  TextEditingController get relationController => _relationController.value;

  TextEditingController get contactPersonPhoneNumberController =>
      _contactPersonPhoneNumberController.value;

  TextEditingController get contactPersonController =>
      _contactPersonController.value;

  TextEditingController get bankAccountTypeController =>
      _bankAccountTypeController.value;

  TextEditingController get bankAccountController =>
      _bankAccountController.value;

  TextEditingController get officeEmailController =>
      _officeEmailController.value;

  TextEditingController get privateEmailController =>
      _privateEmailController.value;

  TextEditingController get phoneController => _phoneController.value;

  bool get isChanging => _isChanging.value;

  List<Profile> get profileHistory => _profileHistory.value;

  bool get isProfileHistoryLoading => _isProfileHistoryLoading.value;

  bool get isUpdate => _isUpdate.value;

  set isUpdate(bool t) => _isUpdate.value = t;
}
