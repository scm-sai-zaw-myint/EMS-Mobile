import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

typedef EyeCallback = Function();
typedef OnDOBChange = Function(DateTime datetime);
typedef OnTimeChange = Function(TimeOfDay time);
typedef DashboardRoute = Function();

class CommonWidget {
  static Color primaryColor = const Color(0xff7f00fe);
  static Color lightColor = const Color(0xfff2e5fe);
  static Color softColor = const Color(0xffbf7ffe);

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
        backgroundColor: primaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      );

  static ButtonStyle secondaryButtonStyle() => ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white);

  static ButtonStyle deleteButtonStyle(Color color) => ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      backgroundColor: color,
      foregroundColor: Colors.white);

  static Padding profileRow(String left, String right) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  left,
                  textAlign: TextAlign.left,
                  style: profileTextStyle(primaryColor),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  right,
                  textAlign: TextAlign.right,
                  style: profileTextStyle(Colors.black54),
                ),
              ),
            ),
          ],
        ),
      );

  static Text profileTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 14, color: primaryColor, fontWeight: FontWeight.bold),
      );

  static TextStyle profileTextStyle(Color color) => TextStyle(
        fontSize: 14,
        color: color,
      );

  static BoxDecoration commonBackground() => const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/img_bg.png"),
          repeat: ImageRepeat.repeat));

  static Text commonLeftLeave(String text) => Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor),
      );

  //validor goes here
  static String? validatePassword(String? pass, [String? prefix]) {
    String p = prefix ?? "Password";
    if (pass!.isEmpty) return "$p cannot be empty";
    if (pass.length < 6) return "$p must contain at least 6 chracters!";
    return null;
  }

  static String? validateAndComparePassword(String? pass, String? compare,
      [String? prefix]) {
    String p = prefix ?? "Password";
    String? valid = validatePassword(pass, prefix);
    if (valid != null) return valid;
    if (pass != compare) {
      return "$p do not match";
    }
    return null;
  }

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
              color: primaryColor,
              size: 50,
            ),
          ),
          Divider(
            color: primaryColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            width: double.infinity,
            color: primaryColor,
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
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }

  static InputDecoration commonInput(title, isDisabled) {
    return InputDecoration(
      filled: true,
      enabled: !isDisabled,
      fillColor: isDisabled ? lightColor : Colors.white,
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
        const SizedBox(height: 10),
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
            DateTime? date = await _selectDate(context, initialDate);
            if (date != null) {
              onDOBChange(date);
            }
          },
          icon: const Icon(Icons.calendar_month_outlined)),
    );
  }

  static Future<DateTime?> _selectDate(context, String? initialDate) async {
    DateTime inputDate =initialDate == "" ? DateTime.now() : DateTime.parse(DMYtoYMD(initialDate!));
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate:inputDate
          ,
      firstDate: DateTime(1900), lastDate: DateTime(2050),
    );
    return date;
  }

  static InputDecoration timeInput(
      context, text, OnTimeChange onTimeChange, TimeOfDay inputTime) {
    return InputDecoration(
      hintText: "$text",
      contentPadding: const EdgeInsets.all(8),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      suffixIcon: IconButton(
          onPressed: () async {
            displayTimePicker(context, onTimeChange, inputTime);
          },
          icon: const Icon(Icons.access_time_sharp)),
    );
  }

  static BoxDecoration calendarDayActive() => BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: primaryColor);
  static BoxDecoration calendarWFHDay() =>
      BoxDecoration(borderRadius: BorderRadius.circular(10), color: softColor);
  static BoxDecoration calendarOfficeDay() =>
      BoxDecoration(borderRadius: BorderRadius.circular(10), color: lightColor);
  static BoxDecoration calendarLeaveDay() => BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: Colors.redAccent);
  static BoxDecoration calendarNoRecDay() => BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: Colors.black54);
  static BoxDecoration calendarHolidayDay() => BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: Colors.black12);

  static Future displayTimePicker(BuildContext context,
      OnTimeChange onTimeChange, TimeOfDay inputTime) async {
    var time = await showTimePicker(context: context, initialTime: inputTime);
    if (time != null) {
      onTimeChange(time);
    }
  }

  static TimeOfDay getTimeOfDayFromString(String timeString) {
    final DateFormat formatter = DateFormat.Hm();
    final DateTime dateTime = formatter.parse(timeString);
    return TimeOfDay.fromDateTime(dateTime);
  }

  /// Menu lists
  static List<Widget> mainMenuList = [
    ListTile(
      title: const Text("Profile"),
      leading: const Icon(Icons.people),
      shape: RoundedRectangleBorder(
        // Change the shape of the tile
        borderRadius: BorderRadius.circular(8),
      ),
      selected: true,
      selectedColor: Colors.blue,
    ).wrappedWithContainer(
      color:
          Colors.blue.withOpacity(0.2), // set the desired background color here
    ),
    Container(
      color: Colors.blue.withOpacity(0.2), // set the desired background
      child: ExpansionTile(
        title: const Text('My List Tile'),
        collapsedBackgroundColor: Colors.blue.withOpacity(0.1),
        // set background color
        children: const <Widget>[
          Text('Accordion content goes here'),
        ],
      ),
    )
  ];

  static InputDecoration commonAttachmentFile() {
    return InputDecoration(
      hintText: "Attach File",
      contentPadding: const EdgeInsets.all(8),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      suffixIcon: IconButton(
          onPressed: () async {
            await CommonWidget.pickFile();
          },
          icon: const Icon(Icons.attach_file)),
    );
  }

  static Future<String> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result == null) {
      print("File is null");
    }
    return result!.files.single.path!;
  }

  static DecoratedBox commonStatus(String text) {
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: CommonWidget.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: Text(text,
              style: TextStyle(fontSize: 10, color: CommonWidget.primaryColor)),
        ));
  }

  static BoxDecoration commonDialogTitle(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)));
  }

  static String YMDtoDMY(String ymd) {
    List<String> dmy = ymd.toString().split("-");
    return "${dmy[2]}/${dmy[1]}/${dmy[0]}";
  }

  static String DMYtoYMD(String dmy) {
    List<String> ymd = dmy.toString().split("/");
    return "${ymd [2]}-${ymd[1]}-${ymd[0]}";
  }

  static Dialog errorAlert(String errMsg) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: CommonWidget.commonDialogTitle(Colors.red),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Error!",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.warning, size: 60, color: Colors.red),
                    const SizedBox(height: 8),
                    Text(errMsg, style: const TextStyle(fontSize: 20))
                  ],
                ),
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
                      style: CommonWidget.deleteButtonStyle(Colors.grey),
                      child: const Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }

  static List<DateTime> getWeekdaysBetweenDates(DateTime startDate, DateTime endDate) {
  List<DateTime> weekdays = [];
  for (var date = startDate; date.isBefore(endDate.add(const Duration(days: 1))); date = date.add(const Duration(days: 1))) {
    if (date.weekday != 6 && date.weekday != 7) {
      weekdays.add(date);
    }
  }
  return weekdays;
}
}

extension ListTileWrapper on ListTile {
  Widget wrappedWithContainer({
    Key? key,
    required Color color,
    double? width,
    double? height,
  }) {
    return Container(
      key: key,
      color: color,
      width: width,
      height: height,
      child: this,
    );
  }
}
