import 'package:ems_mobile/Screens/Overtime/overtime_report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef EyeCallback = Function();
typedef OnDOBChange = Function(DateTime datetime);
typedef OnTimeChange = Function(TimeOfDay time);
typedef DashboardRoute = Function();

class CommonWidget {
  static InputDecoration inputDecoration(String name) => InputDecoration(
        hintText: name,
        labelText: name,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );
  static InputDecoration passwordInputDecoration(
          String name, Icon icon, EyeCallback callback) =>
      InputDecoration(
        hintText: name,
        labelText: name,
        suffixIcon: IconButton(
          icon: icon,
          onPressed: callback,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );
  static ButtonStyle primaryButtonStyle() => ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      );
  static ButtonStyle secondaryButtonStyle() => ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      foregroundColor: Colors.black);

  static Card cardStyle(IconData? cardIcon, text, DashboardRoute route) {
    return Card(
      shadowColor: Colors.teal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      //color: Colors.black,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Icon(
              cardIcon,
              color: const Color(0xFF2b98f0),
              size: 50,
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 0,
          ),
          Container(
            width: double.infinity,
            color: const Color(0xFF1f3053),
            child: TextButton(
              onPressed: route,
              child: Text(
                "$text",
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Text commonText(text) {
    return Text(
      "$text",
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFF006b42),
      ),
    );
  }

  static InputDecoration commonInput(title, isDisabled) {
    return InputDecoration(
      filled: true,
      fillColor: isDisabled ? const Color(0x22006b42) : Colors.white,
      hintText: title,
      contentPadding: const EdgeInsets.all(8),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  static Column commonInputwithTitle(title, initValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title"),
        SizedBox(height: 10),
        TextFormField(
          initialValue: "$initValue",
          decoration: commonInput("$title", false),
          validator: (value) => isEmpty(value, title),
          onChanged: (value) => initValue = value,
        )
      ],
    );
  }

  static String? isEmpty(value, title) {
    if (value == null || value.isEmpty) {
      return "Please enter $title!";
    }
    return null;
  }

  static InputDecoration dobDecoration(
      context, title, initialDate, OnDOBChange onDOBChange) {
    return InputDecoration(
      hintText: "$title",
      contentPadding: const EdgeInsets.all(8),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      suffixIcon: IconButton(
          onPressed: () async {
            DateTime? date =
                await _selectDate(context, DateTime.parse(initialDate));
            if (date != null) {
              onDOBChange(date);
            }
          },
          icon: const Icon(Icons.calendar_month_outlined)),
    );
  }

  static Future<DateTime?> _selectDate(context, DateTime? initialDate) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    return date;
  }

  static InputDecoration timeInput(context, text, OnTimeChange onTimeChange) {
    return InputDecoration(
      hintText: "$text",
      contentPadding: const EdgeInsets.all(8),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      suffixIcon: IconButton(
          onPressed: () async {
            displayTimePicker(context, onTimeChange);
          },
          icon: const Icon(Icons.access_time_sharp)),
    );
  }

  static Future displayTimePicker(
      BuildContext context, OnTimeChange onTimeChange) async {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      onTimeChange(time);
    }
  }
}
