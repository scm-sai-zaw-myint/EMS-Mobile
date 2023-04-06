class Overtime {
  int? overtimeRecordId;
  String employeeId;
  String employeeName;
  String departmentName;
  String? fromDate;
  String? toDate;
  String? appliedDate;
  String? fromTime;
  String? toTime;
  double? otHour;
  String? description;
  String? overTimeStatus;
  String? remark;
  bool? delFlag;

  Overtime({
    required this.employeeId,
    required this.employeeName,
    required this.departmentName,
    // required this.appliedDate,
    // required this.fromTime,
    // required this.toTime,
    // required this.otHour,
    // required this.description,
    // required this.remark,
    // required this.delFlag,
  });

  Overtime.empty()
      : employeeId = "",
        employeeName = "",
        departmentName = "",
        appliedDate = "",
        fromTime = "",
        toTime = "",
        otHour = 0.0,
        description = "",
        remark = "",
        delFlag = false;

  factory Overtime.fromJson(Map<String, dynamic> json) {
    return Overtime(
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      departmentName: json['departmentName'],
      // appliedDate: json['appliedDate'] == null ? "" : DateTime.parse(json['appliedDate']),
      // fromTime: json['fromTime'],
      // toTime: json['toTime'],
      // otHour: json['otHour'],
      // description: json['description'],
      // remark: json['remark'],
      // delFlag: json['delFlag'],
    );
  }
  static Map<String, dynamic> toJson(Overtime overtime) {
    return {
      "employeeId": overtime.employeeId,
      "employeeName": overtime.employeeName,
      "departmentName": overtime.departmentName,
      "appliedDate": overtime.appliedDate,
      "fromTime": overtime.fromTime,
      "toTime": overtime.toTime,
      "otHour": overtime.otHour,
      "description": overtime.description,
      "remark": "",
      "delFlag": false
    };
  }
}
