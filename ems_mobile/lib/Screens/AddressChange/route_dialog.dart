import 'package:ems_mobile/Screens/AddressChange/address_change_report.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteDialog extends StatefulWidget {
  @override
  State<RouteDialog> createState() => _RouteDialogState();
}

class _RouteDialogState extends State<RouteDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Bus', 'Taxi', 'Other'];
    String dropdownValue = list.first;
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: CommonWidget.softColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Route Add",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidget.commonText("From"),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: CommonWidget.commonInput("From", false),
                  ),
                  const SizedBox(height: 5),
                  CommonWidget.commonText("To"),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: CommonWidget.commonInput("To", false),
                  ),
                  const SizedBox(height: 5),
                  CommonWidget.commonText("Travel By"),
                  const SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    decoration: CommonWidget.commonInput("Period", false),
                    isExpanded: true,
                    value: dropdownValue,
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                  // TextFormField(
                  //   decoration: CommonWidget.commonInput("From", false),
                  // ),
                  const SizedBox(height: 5),
                  CommonWidget.commonText("Fee"),
                  const SizedBox(height: 5),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: CommonWidget.commonInput("Fee", false),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: CommonWidget.secondaryButtonStyle(),
                      child: const Text("Close"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: CommonWidget.primaryButtonStyle(),
                      child: const Text("Add Route"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
      // title: Center(
      //   child: const Text("Route Add"),
      // ),
      // content:
    );
  }
}
