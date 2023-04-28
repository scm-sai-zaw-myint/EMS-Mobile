class Leave {
  int? leaveRecordId;
  String? employeeId;
  String? employeeName;
  String? departmentName; //            "departmentName": "Dev-4",
  String? approvedDate; //            "approvedDate": "26/03/2023",
  String? leaveDate; //            "leaveDate": "01/03/2023",
  String? receivedDate; //            "receivedDate": null,
  String? leaveType; //            "leaveType": "Casual",
  int? leaveId; //            "leaveId": 2,
  String? period; //            "period": "3",
  String? description; //            "description": "University case",
  String? status; //            "status": null,
  String? remark; //            "remark": "",
  String? checks; //            "checks": null,
  String? updatedUserId; //            "updatedUserId": null,
  double? totalDays; //            "totalDays": 1.0,
  String? requestedDate; //            "requestedDate": "26/03/2023",
  int? leaveRecordDetailId; //            "leaveRecordDetailId": 1940,
  String? leaveDetailStatus; //            "leaveDetailStatus": "2",
  int? singleTotalCount; //            "singleTotalCount": null,
  List<dynamic>? leaveTypeList; //            "leaveTypeList": [
  //            "Casual",
  //            "Sick",
  //            "Absent",
  //            "Special Leave",
  //            "Compensatory",
  //            "Unpaid"
  //            ],
  int? annualLeaveCount; //            "annualLeaveCount": null,
  int? casualLeaveCount; //            "casualLeaveCount": null,
  int? sickLeaveCount; //            "sickLeaveCount": null,
  int? absentLeaveCount; //            "absentLeaveCount": null,
  int? specialLeaveCount; //            "specialLeaveCount": null,
  int? usedAnnualLeaveCount; //            "usedAnnualLeaveCount": null,
  int? usedCasualLeaveCount; //            "usedCasualLeaveCount": null,
  int? lateDays; //            "lateDays": 0,
  String? annualLeaveResetDate; //            "annualLeaveResetDate": null,
  String? casualLeaveResetDate; //            "casualLeaveResetDate": null,
  String? sickLeaveResetDate; //            "sickLeaveResetDate": null,
  int? leaveFineDay; //            "leaveFineDay": null,
  String? leaveFineDate; //            "leaveFineDate": null,
  int? oldLeaveLeftDay; //            "oldLeaveLeftDay": null,
  String? checkBy; //            "checkBy": "Administrator",
  String?
      dateRangeForReport; //            "dateRangeForReport": "From 01-Mar-2023 To 31-Mar-2023",
  int? usedSickLeaveCount; //            "usedSickLeaveCount": null,
  bool? activeInactive; //            "activeInactive": null,
  int? leftDay; //            "leftDay": null,
  int? totalHour; //            "totalHour": null,
  int? usedHour; //            "usedHour": null,
  double? leftHour; //            "leftHour": null,
  bool? isBeforeResetLeave; //            "isBeforeResetLeave": false,
  String? joinDate; //            "joinDate": null,
  String? annualResetDate; //            "annualResetDate": null,
  String? remainOTDates; //            "remainOTDates": null,
  String? compensatoryOTDate; //            "compensatoryOTDate": null,
  String? otDateStr; //            "otDateStr": null,
  double? compensatoryLeaveCount; //            "compensatoryLeaveCount": 0.0,
  int? totalLeaveLate; //            "totalLeaveLate": null,
  String? attachment; //            "attachment": null,
  bool? sickLeaveReset; //            "sickLeaveReset": false,
  bool? reset; //            "reset": false,
  bool? fullYearEmployee;
  String? date;

  Leave(
      {this.leaveRecordId,
      this.employeeId,
      this.employeeName,
      this.departmentName,
      this.approvedDate,
      this.leaveDate,
      this.receivedDate,
      this.leaveType,
      this.leaveId,
      this.period,
      this.description,
      this.status,
      this.remark,
      this.checks,
      this.updatedUserId,
      this.totalDays,
      this.requestedDate,
      this.leaveRecordDetailId,
      this.leaveDetailStatus,
      this.singleTotalCount,
      this.leaveTypeList,
      this.annualLeaveCount,
      this.casualLeaveCount,
      this.sickLeaveCount,
      this.absentLeaveCount,
      this.specialLeaveCount,
      this.usedAnnualLeaveCount,
      this.usedCasualLeaveCount,
      this.lateDays,
      this.annualLeaveResetDate,
      this.casualLeaveResetDate,
      this.sickLeaveResetDate,
      this.leaveFineDay,
      this.leaveFineDate,
      this.oldLeaveLeftDay,
      this.checkBy,
      this.dateRangeForReport,
      this.usedSickLeaveCount,
      this.activeInactive,
      this.leftDay,
      this.totalHour,
      this.usedHour,
      this.leftHour,
      this.isBeforeResetLeave,
      this.joinDate,
      this.annualResetDate,
      this.remainOTDates,
      this.compensatoryOTDate,
      this.otDateStr,
      this.compensatoryLeaveCount,
      this.totalLeaveLate,
      this.attachment,
      this.sickLeaveReset,
      this.reset,
      this.fullYearEmployee});

  Leave.empty();

  factory Leave.fromJson(Map<String, dynamic> json) {
    return Leave(
        leaveRecordId: json["leaveRecordId"],
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        departmentName: json["departmentName"]??"-",
        approvedDate: json["approvedDate"]??"-",
        leaveDate: json["leaveDate"],
        receivedDate: json["receivedDate"],
        leaveType: json["leaveType"],
        leaveId: json["leaveId"],
        period: json["period"],
        description: json["description"],
        status: json["status"],
        remark: json["remark"]??"-",
        checks: json["checks"],
        updatedUserId: json["updatedUserId"],
        totalDays: json["totalDays"],
        requestedDate: json["requestedDate"],
        leaveRecordDetailId: json["leaveRecordDetailId"],
        leaveDetailStatus: json["leaveDetailStatus"],
        singleTotalCount: json["singleTotalCount"],
        leaveTypeList: json["leaveTypeList"],
        annualLeaveCount: json["annualLeaveCount"],
        casualLeaveCount: json["casualLeaveCount"],
        sickLeaveCount: json["sickLeaveCount"],
        absentLeaveCount: json["absentLeaveCount"],
        specialLeaveCount: json["specialLeaveCount"],
        usedAnnualLeaveCount: json["usedAnnualLeaveCount"],
        usedCasualLeaveCount: json["usedCasualLeaveCount"],
        lateDays: json["lateDays"],
        annualLeaveResetDate: json["annualLeaveResetDate"],
        casualLeaveResetDate: json["casualLeaveResetDate"],
        sickLeaveResetDate: json["sickLeaveResetDate"],
        leaveFineDay: json["leaveFineDay"],
        leaveFineDate: json["leaveFineDate"],
        oldLeaveLeftDay: json["oldLeaveLeftDay"],
        checkBy: json["checkBy"],
        dateRangeForReport: json["dateRangeForReport"],
        usedSickLeaveCount: json["usedSickLeaveCount"],
        activeInactive: json["activeInactive"],
        leftDay: json["leftDay"],
        totalHour: json["totalHour"],
        usedHour: json["usedHour"],
        leftHour: json["leftHour"],
        isBeforeResetLeave: json["isBeforeResetLeave"],
        joinDate: json["joinDate"],
        annualResetDate: json["annualResetDate"],
        remainOTDates: json["remainOTDates"],
        compensatoryOTDate: json["compensatoryOTDate"],
        otDateStr: json["otDateStr"],
        compensatoryLeaveCount: json["compensatoryLeaveCount"],
        totalLeaveLate: json["totalLeaveLate"],
        attachment: json["attachment"],
        sickLeaveReset: json["sickLeaveReset"],
        reset: json["reset"],
        fullYearEmployee: json["fullYearEmployee"]);
  }

  Map<String, dynamic> toJson(){
    return{
      "leaveRecordId": leaveRecordId,
      "employeeId": employeeId,
      "employeeName": employeeName,
      "departmentName": departmentName,
      "approvedDate": approvedDate,
      "leaveDate": leaveDate,
      "receivedDate": receivedDate,
      "leaveType": leaveType,
      "leaveId": leaveId,
      "period": period,
      "description": description,
      "status": status,
      "remark": remark,
      "checks": checks,
      "updatedUserId": updatedUserId,
      "totalDays": totalDays,
      "requestedDate": requestedDate,
      "leaveRecordDetailId": leaveRecordDetailId,
      "leaveDetailStatus": leaveDetailStatus,
      "singleTotalCount": singleTotalCount,
      "leaveTypeList": leaveTypeList,
      "annualLeaveCount": annualLeaveCount,
      "casualLeaveCount": casualLeaveCount,
      "sickLeaveCount": sickLeaveCount,
      "absentLeaveCount": absentLeaveCount,
      "specialLeaveCount": specialLeaveCount,
      "usedAnnualLeaveCount": usedAnnualLeaveCount,
      "usedCasualLeaveCount": usedCasualLeaveCount,
      "lateDays": lateDays,
      "annualLeaveResetDate": annualLeaveResetDate,
      "casualLeaveResetDate": casualLeaveResetDate,
      "sickLeaveResetDate": sickLeaveResetDate,
      "leaveFineDay": leaveFineDay,
      "leaveFineDate": leaveFineDate,
      "oldLeaveLeftDay": oldLeaveLeftDay,
      "checkBy": checkBy,
      "dateRangeForReport": dateRangeForReport,
      "usedSickLeaveCount": usedSickLeaveCount,
      "activeInactive": activeInactive,
      "leftDay": leftDay,
      "totalHour": totalHour,
      "usedHour": usedHour,
      "leftHour": leftHour,
      "isBeforeResetLeave": isBeforeResetLeave,
      "joinDate": joinDate,
      "annualResetDate": annualResetDate,
      "remainOTDates": remainOTDates,
      "compensatoryOTDate": compensatoryOTDate,
      "otDateStr": otDateStr,
      "compensatoryLeaveCount": compensatoryLeaveCount,
      "totalLeaveLate": totalLeaveLate,
      "attachment": attachment,
      "sickLeaveReset": sickLeaveReset,
      "reset": reset,
      "fullYearEmployee": fullYearEmployee
    };
  }
}
