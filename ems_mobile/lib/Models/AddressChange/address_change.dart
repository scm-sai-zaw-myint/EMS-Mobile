class AddressChange {
  int? addressChangeId;
  String employeeId;
  String employeeName;
  String newAddress;
  String? address;
  String startDate;
  String? requestDate;
  String totalFees;
  String? status;
  String? remark;
  String delFlag;

  AddressChange({
    required this.employeeId,
    required this.employeeName,
    required this.newAddress,
    required this.startDate,
    required this.totalFees,
    required this.delFlag,
  });

  AddressChange.empty()
      : employeeId = "",
        employeeName = "",
        newAddress = "",
        startDate = "",
        totalFees = "",
        status = "",
        remark = "",
        delFlag = "0";

  factory AddressChange.fromJson(Map<String, dynamic> json) {
    return AddressChange(
        employeeId: json['employeeId'],
        employeeName: json['employeeName'],
        newAddress: json['newAddress'],
        startDate: json['startDate'],
        totalFees: json['totalFees'],
        delFlag: json['delFlag']);
  }
  static Map<String, dynamic> toJson(AddressChange addressChange) {
    return {
      "employeeId": addressChange.employeeId,
      "employeeName": addressChange.employeeName,
      "address": addressChange.address,
      "startDate": addressChange.startDate,
      "totalFees": addressChange.totalFees,
      "newAddress": addressChange.newAddress,
      "remark": addressChange.remark,
      "delFlag": false,
    };
  }
}
