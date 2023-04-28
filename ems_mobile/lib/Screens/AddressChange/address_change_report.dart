import 'package:ems_mobile/Screens/AddressChange/route_dialog.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/AddressChange/address_change_report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddressChangeRequest extends StatefulWidget {
  const AddressChangeRequest({super.key});

  @override
  State<AddressChangeRequest> createState() => _AddressChangeRequestState();
}

class _AddressChangeRequestState extends State<AddressChangeRequest> {
  final _formKey = GlobalKey<FormState>();
  final String _today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressChangeService>(builder: (controller) {
      //controller.overtimeRegister();
      return Obx(
        () => controller.isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text("Address Change Registration"),
                  backgroundColor: CommonWidget.primaryColor,
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      // padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                CommonWidget.commonText("Employee Id"),
                                const SizedBox(height: 5),
                                TextFormField(
                                  readOnly: true,
                                  //initialValue: controller.overtime.employeeId,
                                  decoration: CommonWidget.commonInput(
                                      "Employee Id", true),
                                  // validator: (value) => CommonWidget.isEmpty(
                                  //     value, "Employee Id"),
                                  //onChanged: (value) => controller.overtime.employeeName = value,
                                ),
                                const SizedBox(height: 15),
                                CommonWidget.commonText("Employee Name"),
                                const SizedBox(height: 5),
                                TextFormField(
                                  readOnly: true,
                                  // initialValue:
                                  //     controller.overtime.employeeName,
                                  decoration: CommonWidget.commonInput(
                                      "Employee Name", true),
                                  //validator: (value) => CommonWidget.isEmpty(value),
                                  // onChanged: (value) =>
                                  //     controller.overtime.employeeName = value,
                                ),
                                const SizedBox(height: 15),
                                CommonWidget.commonText("Address"),
                                const SizedBox(height: 5),
                                TextFormField(
                                  readOnly: true,
                                  // initialValue:
                                  //     controller.overtime.employeeName,
                                  decoration:
                                      CommonWidget.commonInput("Address", true),
                                  //validator: (value) => CommonWidget.isEmpty(value),
                                  // onChanged: (value) =>
                                  //     controller.overtime.appliedDate = value,
                                ),
                                const SizedBox(height: 15),
                                CommonWidget.commonText("New Address"),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: CommonWidget.commonInput(
                                      "New Address", false),
                                  //validator: (value) => CommonWidget.isEmpty(value),
                                  // onChanged: (value) =>
                                  //     controller.overtime.appliedDate = value,
                                ),
                                const SizedBox(height: 15),
                                CommonWidget.commonText("Start Date"),
                                const SizedBox(height: 5),
                                TextFormField(
                                  controller: controller.dateController,
                                  decoration: CommonWidget.dobDecoration(
                                      context,
                                      "Start Date",
                                      controller.dateController.text,
                                      (datetime) => {
                                            setState(() {
                                              controller.dateController.text =
                                                  datetime
                                                      .toString()
                                                      .split(" ")[0];
                                              // controller.overtime.appliedDate =
                                              //     controller
                                              //         .dateController.text;
                                              // DateTime.parse(controller
                                              //     .dateController.text);
                                            })
                                          }),
                                  validator: (value) =>
                                      CommonWidget.isEmpty(value, "Start Date"),
                                  // onChanged: (v) {
                                  //   controller.overtime.appliedDate = v;
                                  // DateTime.parse(
                                  //     controller.dateController.text);
                                  // },
                                ),
                                const SizedBox(height: 15),
                                CommonWidget.commonText("Request Date"),
                                const SizedBox(height: 5),
                                TextFormField(
                                  readOnly: true,
                                  initialValue: _today,
                                  decoration:
                                      CommonWidget.commonInput("", true),
                                  //validator: (value) => CommonWidget.isEmpty(value),
                                  // onChanged: (value) =>
                                  //     controller.overtime.appliedDate = value,
                                ),
                                const SizedBox(height: 15),
                                CommonWidget.commonText("Total Fees"),
                                const SizedBox(height: 5),
                                TextFormField(
                                  controller: controller.otHourController,
                                  readOnly: true,
                                  enabled: false,
                                  //initialValue: "0.0",
                                  decoration: CommonWidget.commonInput(
                                      "Total Fees", true),
                                  validator: (value) =>
                                      CommonWidget.isEmpty(value, ""),
                                  // onChanged: (value) =>
                                  //     controller.overtime.employeeName = value,
                                ),
                                const SizedBox(height: 15),
                                CommonWidget.commonText("Description"),
                                const SizedBox(height: 5),
                                TextFormField(
                                  maxLines: 3,
                                  decoration: CommonWidget.commonInput(
                                      "Description", false),
                                  validator: (value) => CommonWidget.isEmpty(
                                      value, "Description"),
                                  // onChanged: (value) =>
                                  //     controller.overtime.description = value,
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Address Change Route Information",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: CommonWidget.primaryColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: controller.list.map((e) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0XFFFFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 3,
                                        offset: const Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonWidget.commonText("a -> b"),
                                              PopupMenuButton(
                                                icon:
                                                    const Icon(Icons.more_vert),
                                                tooltip: "Setting",
                                                offset: const Offset(50, 35),
                                                itemBuilder:
                                                    (BuildContext context) {
                                                  return [
                                                    const PopupMenuItem(
                                                      child: Text('Edit'),
                                                    ),
                                                    const PopupMenuItem(
                                                      child: Text('Delete'),
                                                    ),
                                                  ];
                                                },
                                                onSelected: (value) {},
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Text("Bus"),
                                              Column(
                                                children: const [
                                                  Text("Fee"),
                                                  Text("1000")
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return RouteDialog();
                                              });
                                        },
                                        style:
                                            CommonWidget.primaryButtonStyle(),
                                        child: const Text("Add Route"),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style:
                                            CommonWidget.primaryButtonStyle(),
                                        child: const Text("Save"),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      flex: 1,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style:
                                            CommonWidget.primaryButtonStyle(),
                                        child: const Text("Reset"),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      flex: 1,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style:
                                            CommonWidget.primaryButtonStyle(),
                                        child: const Text("Request"),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
