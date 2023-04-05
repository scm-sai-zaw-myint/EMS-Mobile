import 'package:ems_mobile/Models/Overtime/overtime_model.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OvertimeReport extends StatefulWidget {
  const OvertimeReport({super.key});

  @override
  State<OvertimeReport> createState() => _OvertimeReportState();
}

class _OvertimeReportState extends State<OvertimeReport> {
  final _formKey = GlobalKey<FormState>();
  final Overtime _form = Overtime.empty();
  final _dateController = TextEditingController();
  final _fromTimeController = TextEditingController();
  final _toTimeController = TextEditingController();

  @override
  void initState() {
    _dateController.text = DateTime.now().toString().split(" ")[0];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height: 30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Employee Id"),
                      const SizedBox(height: 5),
                      TextFormField(
                        readOnly: true,
                        initialValue: _form.employeeName,
                        decoration:
                            CommonWidget.commonInput("Employee Id", true),
                        //validator: (value) => CommonWidget.isEmpty(value),
                        onChanged: (value) => _form.employeeName = value,
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Employee Name"),
                      const SizedBox(height: 5),
                      TextFormField(
                        readOnly: true,
                        initialValue: _form.employeeName,
                        decoration:
                            CommonWidget.commonInput("Employee Name", true),
                        //validator: (value) => CommonWidget.isEmpty(value),
                        onChanged: (value) => _form.employeeName = value,
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Department Name"),
                      const SizedBox(height: 5),
                      TextFormField(
                        readOnly: true,
                        initialValue: _form.employeeName,
                        decoration:
                            CommonWidget.commonInput("Department Name", true),
                        //validator: (value) => CommonWidget.isEmpty(value),
                        onChanged: (value) => _form.employeeName = value,
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Overtime Date"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _dateController,
                        decoration: CommonWidget.dobDecoration(
                            context,
                            "Overtime Date",
                            _dateController.text,
                            (datetime) => {
                                  setState(() {
                                    _dateController.text =
                                        datetime.toString().split(" ")[0];
                                    _form.appliedDate =
                                        DateTime.parse(_dateController.text);
                                  })
                                }),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "Overtime Date"),
                        onChanged: (v) {
                          _form.appliedDate =
                              DateTime.parse(_dateController.text);
                        },
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("From Time"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _fromTimeController,
                        readOnly: true,
                        decoration: CommonWidget.timeInput(
                            context,
                            "From Time",
                            (time) => {
                                  setState(() {
                                    _fromTimeController.text =
                                        "${time.hour}:${time.minute}";
                                  }),
                                }),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "From Time"),
                        onChanged: (v) {
                          _form.fromTime = _fromTimeController.text;
                        },
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("To Time"),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _toTimeController,
                        readOnly: true,
                        decoration: CommonWidget.timeInput(
                            context,
                            "To Time",
                            (time) => {
                                  setState(() {
                                    _toTimeController.text =
                                        "${time.hour}:${time.minute}";
                                  }),
                                }),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "To Time"),
                        onChanged: (v) {
                          _form.toTime = _toTimeController.text;
                        },
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("OT Hour"),
                      const SizedBox(height: 5),
                      TextFormField(
                        readOnly: true,
                        enabled: false,
                        initialValue: _form.otHour.toString(),
                        decoration: CommonWidget.commonInput("OT Hour", true),
                        //validator: (value) => CommonWidget.isEmpty(value, ""),
                        onChanged: (value) => _form.employeeName = value,
                      ),
                      const SizedBox(height: 15),
                      CommonWidget.commonText("Description"),
                      const SizedBox(height: 5),
                      TextFormField(
                        initialValue: _form.description,
                        maxLines: 3,
                        decoration:
                            CommonWidget.commonInput("Description", false),
                        validator: (value) =>
                            CommonWidget.isEmpty(value, "Description"),
                        onChanged: (value) => _form.description = value,
                      ),
                    ],
                  ),
                  // CommonWidget.commonInputwithTitle(
                  //     "Employee Name", _form.employeeName),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: Text("Save"),
                          style: CommonWidget.secondaryButtonStyle(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: Text("Request"),
                          style: CommonWidget.primaryButtonStyle(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
