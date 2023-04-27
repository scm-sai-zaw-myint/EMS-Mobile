import 'dart:convert';

import 'package:ems_mobile/Models/Transportation/transportation.dart';
import 'package:ems_mobile/Services/Common/api_service.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransportationService extends GetxController{
  final ApiService _api = ApiService();
  final travelByLists = ["Bus","Motorbike","Taxi","Trishaw","Other"];
  final travelTypeLists = ["One Way","Round Trip"];

  late Transportation transportation = Transportation.empty();
  Transportation transportationDetail = Transportation.empty();

  final _transportationList = <Transportation>[].obs;

  //text controllers
  final _travelDateController = TextEditingController().obs;
  final _feeController = TextEditingController().obs;
  final _sourceController = TextEditingController().obs;
  final _destinationController = TextEditingController().obs;
  final _descriptionController = TextEditingController().obs;

  final _selectedTravelByValue = "".obs;
  final _selectedTravelTypeValue = "".obs;

  final _loading = false.obs;
  final _isUpdate = false.obs;

  @override
  void onInit() {
    _selectedTravelByValue.value = travelByLists.first;
    _selectedTravelTypeValue.value = travelTypeLists.first;
    fetchData();
    super.onInit();
  }

  Future<bool> fetchData() async{
    _loading(true);
    final result = await _api.post("${Config.domainUrl}${Config.transportationHistory}/search?offset=1&limit=10",{
      "year": DateTime.now().year,
      "month": DateTime.now().month
    });
    _loading(false);
    if(result.statusCode != 200) return false;
    final body = jsonDecode(result.body);
    final list = body["otherTransportationList"] as List<dynamic>;
    _transportationList.value = list.map((e) => Transportation.fromJson(e)).toList();
    return true;
  }

  Future<bool> executeTransportation(bool request) async{
    transportation.travelDate = travelDateController.text;
    transportation.fees = int.parse(feeController.text);
    transportation.source = sourceController.text;
    transportation.destination = destinationController.text;
    transportation.travelBy = selectedTravelByValue;
    transportation.travelType = selectedTravelTypeValue;
    transportation.description = descriptionController.text;
    String requestURL = isUpdate ? Config.editTransportation : Config.transportationRequest;
    final response = await _api.post("${Config.domainUrl}$requestURL${!isUpdate && request? "?request=request" :""}",
      transportation.toJson()
    );
    transportation = Transportation.empty();
    if(response.statusCode != 200) {
      return false;
    }
    await fetchData();
    return true;
  }

  initializedData(){
    travelDateController.text = transportation.travelDate??"";
    feeController.text = "${transportation.fees??0}";
    sourceController.text = transportation.source??"";
    descriptionController.text = transportation.description??"";
    destinationController.text = transportation.destination??"";
    _selectedTravelByValue.value = transportation.travelBy??"Bus";
    _selectedTravelTypeValue.value = transportation.travelType??"One Way";
  }

  DateTime parseDate(String date){
    List<String> ddate = date.split("/");
    if(ddate.isEmpty) return DateTime.now();
    return DateFormat("yyyy-MM-dd").parse("${ddate[2]}-${ddate[1]}-${ddate[0]}");
  }
  String toDateString(DateTime date){
    return DateFormat("dd/MM/yyyy").format(date).toString();
  }
  String get selectedTravelByValue => _selectedTravelByValue.value;
  String get selectedTravelTypeValue => _selectedTravelTypeValue.value;

  TextEditingController get descriptionController => _descriptionController.value;

  TextEditingController get destinationController => _destinationController.value;

  TextEditingController get sourceController => _sourceController.value;

  TextEditingController get feeController => _feeController.value;

  TextEditingController get travelDateController => _travelDateController.value;

  List<Transportation> get transportationList => _transportationList.value;

  bool get isUpdate => _isUpdate.value;
  set isUpdate(bool b) => _isUpdate.value = b;

  set selectedTravelTypeValue(value) {
    _selectedTravelTypeValue.value = value;
  }

  set selectedTravelByValue(value) {
    _selectedTravelByValue.value = value;
  }
}