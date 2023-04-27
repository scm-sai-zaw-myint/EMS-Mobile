import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:ems_mobile/Services/Transportation/transportation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransportationPage extends StatelessWidget {
  TransportationPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ProfileService profileController = Get.find();
    return GetBuilder<TransportationService>(
      builder: (controller) {
        controller.transportation.employeeId =
            profileController.employee.employeeId;
        controller.transportation.employeeName =
            profileController.employee.employeeName;
        controller.transportation.requestDate =
            controller.toDateString(DateTime.now());
        controller.initializedData();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Other Transportation Request"),
            backgroundColor: CommonWidget.primaryColor,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Employee Id"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: controller.transportation.employeeId,
                      decoration: CommonWidget.commonInput("Employee Id", true),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ////////
                    const Text("Name"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: controller.transportation.employeeName,
                      decoration: CommonWidget.commonInput("Name", true),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    const Text("Request Date"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: controller.transportation.requestDate,
                      decoration:
                          CommonWidget.commonInput("Request Date", true),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    const Text("Travel Date"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.travelDateController,
                      validator: (value) {
                        if (value != null && value.isEmpty)
                          return "Travel date cannot be empty!";
                        return null;
                      },
                      decoration: CommonWidget.dobDecoration(
                          context,
                          "Travel Date",
                          DateTime.now(),
                          (datetime) => {
                                controller.travelDateController.text =
                                    controller.toDateString(datetime)
                              }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    const Text("Fees"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.feeController,
                      validator: (value) {
                        if (value != null && value.isEmpty)
                          return "Fees cannot be empty!";
                        return null;
                      },
                      decoration: CommonWidget.commonInput("Fees", false),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    const Text("Source"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.sourceController,
                      validator: (value) {
                        if (value != null && value.isEmpty)
                          return "Source cannot be empty!";
                        return null;
                      },
                      decoration: CommonWidget.commonInput("Source", false),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    const Text("Destination"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.destinationController,
                      validator: (value) {
                        if (value != null && value.isEmpty)
                          return "Destination cannot be empty!";
                        return null;
                      },
                      decoration:
                          CommonWidget.commonInput("Destination", false),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    const Text("Travel By"),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: CommonWidget.commonInput("Travel By", false),
                      isExpanded: true,
                      value: controller.selectedTravelByValue,
                      items: controller.travelByLists
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue == null || newValue.isEmpty) {
                          return;
                        }
                        controller.selectedTravelByValue = newValue;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    const Text("Travel Type"),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      decoration:
                          CommonWidget.commonInput("Travel Type", false),
                      isExpanded: true,
                      value: controller.selectedTravelTypeValue,
                      items: controller.travelTypeLists
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue == null || newValue.isEmpty) {
                          return;
                        }
                        controller.selectedTravelTypeValue = newValue;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    const Text("Description"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.descriptionController,
                      validator: (value) {
                        if (value != null && value.isEmpty)
                          return "Description cannot be empty!";
                        return null;
                      },
                      decoration:
                          CommonWidget.commonInput("Description", false),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool request = await controller
                                    .executeTransportation(false);
                                if (request) {
                                  await controller.fetchData();
                                  Get.offNamed(
                                      Config.transportationHistoryPage);
                                }
                              }
                            },
                            style: CommonWidget.secondaryButtonStyle(100),
                            child: const Text("Save")),
                        controller.isUpdate
                            ? ElevatedButton(
                                onPressed: () {
                                  controller.isUpdate = false;
                                  Get.back();
                                },
                                style: CommonWidget.primaryButtonStyle(100),
                                child: const Text("Back"))
                            : ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    bool request = await controller
                                        .executeTransportation(true);
                                    if (request) {
                                      await controller.fetchData();
                                      Get.offNamed(
                                          Config.transportationHistoryPage);
                                    }
                                  }
                                },
                                style: CommonWidget.primaryButtonStyle(100),
                                child: const Text("Request"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
