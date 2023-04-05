class Overtime {
  int? id;
  String employeeId;
  String employeeName;
  String departmentName;
  String? fromDate;
  String? toDate;
  DateTime appliedDate;
  String fromTime;
  String toTime;
  double otHour;
  String description;
  String? overTimeStatus;
  String remark;
  bool delFlag;

  Overtime({
    required this.employeeId,
    required this.employeeName,
    required this.departmentName,
    required this.appliedDate,
    required this.fromTime,
    required this.toTime,
    required this.otHour,
    required this.description,
    required this.remark,
    required this.delFlag,
  });

  Overtime.empty()
      : employeeId = "",
        employeeName = "",
        departmentName = "",
        appliedDate = DateTime.now(),
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
      appliedDate: DateTime.parse(json['appliedDate']),
      fromTime: json['fromTime'],
      toTime: json['toTime'],
      otHour: json['otHour'],
      description: json['description'],
      remark: json['remark'],
      delFlag: json['delFlag'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "employeeId": employeeId,
      "employeeName": employeeName,
      "departmentName": departmentName,
      "appliedDate": appliedDate,
      "fromTime": fromTime,
      "toTime": toTime,
      "otHour": otHour,
      "description": description,
      "remark": remark,
      "delFlag": delFlag
    };
  }
}
