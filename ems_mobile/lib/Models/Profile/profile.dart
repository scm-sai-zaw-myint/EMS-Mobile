class Profile {
  int? profileUpdateID; // Integer
  String? employeeId;
  String? employeeName;
  String? position;
  String? departmentName;
  DateTime? joinDate;
  int? dateOfBirth;
  String? contactPerson;
  String? contactPhone;
  String? relation;
  String? gender;
  String? type;
  String? remark;
  String? phone;
  String? email;
  String? officeEmail;
  String? address;
  String? profileRequestStatus;
  bool? delFlag;
  List<String>? checks;
  String? createdUserId;
  int? createdDateTime;
  String? updatedUserId;
  int? updatedDateTime;
  String? photo;
  String? cardId;
  int? employeeType;
  String? nrc;
  int? nrcDob;
  double? basicSalary;
  int? signOutDate;
  String? macAddress;
  String? bankAccount;
  String? bankAccountType;
  String? graduateUniversity;
  String? graduateDegree;
  String? pcNo;
  String? pcPassword;
  String? jlpt;
  String? languageSkill;
  double? iqTestRemark;
  bool? useFerry;
  List<String>? divisionName;
  String? companyName;
  String? maritalStatus;
  String? fromDate;
  String? toDate;
  String? ssbNo;
  int? ssbCardIssueDate;
  String? religion;
  bool? tranFlg;

  Profile(this.profileUpdateID,
      this.employeeId,
      this.employeeName,
      this.position,
      this.departmentName,
      this.joinDate,
      this.dateOfBirth,
      this.contactPerson,
      this.contactPhone,
      this.relation,
      this.gender,
      this.type,
      this.remark,
      this.phone,
      this.email,
      this.officeEmail,
      this.address,
      this.profileRequestStatus,
      this.delFlag,
      this.checks,
      this.createdUserId,
      this.createdDateTime,
      this.updatedUserId,
      this.updatedDateTime,
      this.photo,
      this.cardId,
      this.employeeType,
      this.nrc,
      this.nrcDob,
      this.basicSalary,
      this.signOutDate,
      this.macAddress,
      this.bankAccount,
      this.bankAccountType,
      this.graduateUniversity,
      this.graduateDegree,
      this.pcNo,
      this.pcPassword,
      this.jlpt,
      this.languageSkill,
      this.iqTestRemark,
      this.useFerry,
      this.divisionName,
      this.companyName,
      this.maritalStatus,
      this.fromDate,
      this.toDate,
      this.ssbNo,
      this.ssbCardIssueDate,
      this.religion,
      this.tranFlg);

  Profile.empty();

  factory Profile.fromJson(Map<String, dynamic> json) =>
      Profile(
          json["profileUpdateID"],
          json["employeeId"],
          json["employeeName"],
          json["position"],
          json["departmentName"],
          json["joinDate"],
          json["dateOfBirth"],
          json["contactPerson"],
          json["contactPhone"],
          json["relation"],
          json["gender"],
          json["type"],
          json["remark"],
          json["phone"],
          json["email"],
          json["officeEmail"],
          json["address"],
          json["profileRequestStatus"],
          json["delFlag"],
          json["checks"],
          json["createdUserId"],
          json["createdDateTime"],
          json["updatedUserId"],
          json["updatedDateTime"],
          json["photo"],
          json["cardId"],
          json["employeeType"],
          json["nrc"],
          json["nrcDob"],
          json["basicSalary"],
          json["signOutDate"],
          json["macAddress"],
          json["bankAccount"],
          json["bankAccountType"],
          json["graduateUniversity"],
          json["graduateDegree"],
          json["pcNo"],
          json["pcPassword"],
          json["jlpt"],
          json["languageSkill"],
          json["iqTestRemark"],
          json["useFerry"],
          json["divisionName"],
          json["companyName"],
          json["maritalStatus"],
          json["fromDate"],
          json["toDate"],
          json["ssbNo"],
          json["ssbCardIssueDate"],
          json["religion"],
          json["tranFlg"]);

  Map<String, dynamic> toJson() {
    return {
      "profileUpdateID": profileUpdateID,
      "employeeId": employeeId,
      "employeeName": employeeName,
      "position": position,
      "departmentName": departmentName,
      "joinDate": joinDate,
      "dateOfBirth": dateOfBirth,
      "contactPerson": contactPerson,
      "contactPhone": contactPhone,
      "relation": relation,
      "gender": gender,
      "type": type,
      "remark": remark,
      "phone": phone,
      "email": email,
      "officeEmail": officeEmail,
      "address": address,
      "profileRequestStatus": profileRequestStatus,
      "delFlag": delFlag,
      "checks": checks,
      "createdUserId": createdUserId,
      "createdDateTime": createdDateTime,
      "updatedUserId": updatedUserId,
      "updatedDateTime": updatedDateTime,
      "photo": photo,
      "cardId": cardId,
      "employeeType": employeeType,
      "nrc": nrc,
      "nrcDob": nrcDob,
      "basicSalary": basicSalary,
      "signOutDate": signOutDate,
      "macAddress": macAddress,
      "bankAccount": bankAccount,
      "bankAccountType": bankAccountType,
      "graduateUniversity": graduateUniversity,
      "graduateDegree": graduateDegree,
      "pcNo": pcNo,
      "pcPassword": pcPassword,
      "jlpt": jlpt,
      "languageSkill": languageSkill,
      "iqTestRemark": iqTestRemark,
      "useFerry": useFerry,
      "divisionName": divisionName,
      "companyName": companyName,
      "maritalStatus": maritalStatus,
      "fromDate": fromDate,
      "toDate": toDate,
      "ssbNo": ssbNo,
      "ssbCardIssueDate": ssbCardIssueDate,
      "religion": religion
    };
  }
}
