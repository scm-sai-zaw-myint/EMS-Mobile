import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Common/common_widget.dart';

class ProfileChangeRequestPage extends StatelessWidget {
  ProfileChangeRequestPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    showSnackBar(String message){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message))
      );
    }
    return GetBuilder<ProfileService>(builder: (controller) {
      controller.initiatedValues();
      return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Change Request"),
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
                  const SizedBox(height: 10,),
                  TextFormField(
                    initialValue: controller.employee.employeeId,
                    decoration: CommonWidget.commonInput("Employee Id", true),
                  ),
                  const SizedBox(height: 20,),
                  ////////
                  const Text("Name"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    initialValue: controller.employee.employeeName,
                    decoration: CommonWidget.commonInput("Name", true),
                  ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("Position"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    initialValue: controller.employee.position,
                    decoration: CommonWidget.commonInput("Position", true),
                  ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("Phone"),
                  TextFormField(
                    controller: controller.phoneController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "Phone cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("Phone", false),
                  ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("Private Email"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.privateEmailController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "Private email cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("Private Email", false),
                  ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("Office Email"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.officeEmailController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "Office email cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("Office Email", false),
                  ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("Bank Account Type"),
                  const SizedBox(height: 10,),
              DropdownButtonFormField<String>(
                decoration:
                CommonWidget.commonInput("Travel By", false),
                isExpanded: true,
                value: controller.bankAccountType[controller.bankAccountTypeController.text],
                items: controller.bankAccountType.values.toList().map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  if(newValue == null || newValue.isEmpty) return;
                  controller.bankAccountType.forEach((key, value) {
                    if(value == newValue){
                      controller.bankAccountTypeController.text = newValue;
                      return;
                    }
                  });
                },
              ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("Contact Person"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.contactPersonController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "Contact person cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("Contact Person", false),
                  ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("Contact Person Phone Number"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.contactPersonPhoneNumberController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "Contact person phone number cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("Bank Account Type", false),
                  ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("Relation"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.relationController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "Relation cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("Relation", false),
                  ),
                  const SizedBox(height: 20,),
                  /////
                  const Text("MAC Address"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.macAddressController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "MAC Address cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("MAC Address", false),
                  ),
                  const SizedBox(height: 20,),
                  ///////
                  const Text("PC No"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.pcNoController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "PC number cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("PC No", false),
                  ),
                  const SizedBox(height: 20,),
                  /////
                  const Text("PC Password"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.pcPasswordController,
                    validator: (value) {
                      if(value != null && value.isEmpty) return "PC password cannot be empty!";
                      return null;
                    },
                    decoration: CommonWidget.commonInput("PC password", false),
                  ),
                  const SizedBox(height: 20,),
                  /////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                              String? request = await controller.changeProfile(false);
                              if(request!=null){
                                showSnackBar(request);
                              }else{
                                await controller.fetchProfileHistory();
                                Get.back();
                              }
                            }
                          },
                          style: CommonWidget.secondaryButtonStyle(100),
                          child: const Text("Save")
                      ),
                      ElevatedButton(
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                              controller.initiatedValues();
                            }
                          },
                          style: CommonWidget.saveButtonStyle(100),
                          child: const Text("Reset")
                      ),
                      controller.isUpdate ?
                      ElevatedButton(
                          onPressed: () async{
                            controller.isUpdate = false;
                            Get.back();
                          },
                          style: CommonWidget.primaryButtonStyle(100),
                          child: const Text("Back")
                      ):
                      ElevatedButton(
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                              String? request = await controller.changeProfile(true);
                              if(request!=null){
                                showSnackBar(request);
                              }else{
                                await controller.fetchProfileHistory();
                                Get.back();
                              }
                            }
                          },
                          style: CommonWidget.primaryButtonStyle(100),
                          child: const Text("Request")
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },);
  }
}