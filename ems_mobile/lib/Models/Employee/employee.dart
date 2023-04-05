import 'dart:io';

class Employee{

     String? employeeId;

     int? companyId;
 
     String? companyType;

     String? cardId;

     String? contractNo;

     int? employeeType;

     String? position;

     String? positionStartDate;

     String? password;

     String? confirmPassword;

     String? newPassword;

     String? employeeName;

     String? address;

     String? phone;

     String? email;

     String? officeEmail;

     Object? personalInfoForm;
 
     String? gender;
 
     int? type;

     String? nrc;

 
     String? dateOfBirth;

     String? nrcDob;

     String? photo;

     String? basicSalary;

     String? signOutDate;

     String? joinDate;

     String? contactPhone;

     String? maritalStatus;

     String? contactName;

     String? relation;

     String? homeAddress;

     String? macAddress;

     String? bankAccountType;

     String? bankAccount;

     String? graduateUniversity;

     String? graduateDegree;

     String? pcNo;

     String? pcPassword;

     String? jlpt;

     String? languageSkill;

     double? iqTestRemark;

     bool? useFerry;

     File? file;

     String? createdUserId;

     String? updatedUserId;

     String? departmentName;

     String? managerId;

     String? managerName;

     List<String>? divisionName;
 
     String? department;

    Employee({
      required this.address,
      required this.bankAccount,
      required this.bankAccountType,
      required this.basicSalary,
      required this.cardId,
      required this.companyId,
      required this.companyType,
      required this.confirmPassword,
      required this.contactName,
      required this.contactPhone,
      required this.contractNo,
      required this.createdUserId,
      required this.dateOfBirth,
      required this.department,
      required this.departmentName,
      required this.divisionName,
      required this.email,
      required this.employeeId,
      required this.employeeName,
      required this.employeeType,
      required this.file,
      required this.gender,
      required this.graduateDegree,
      required this.graduateUniversity,
      required this.homeAddress,
      required this.iqTestRemark,
      required this.jlpt,
      required this.joinDate,
      required this.languageSkill,
      required this.macAddress,
      required this.managerId,
      required this.managerName,
      required this.maritalStatus,
      required this.newPassword,
      required this.nrc,
      required this.nrcDob,
      required this.officeEmail,
      required this.password,
      required this.pcNo,
      required this.pcPassword,
      required this.personalInfoForm,
      required this.phone,
      required this.photo,
      required this.position,
      required this.positionStartDate,
      required this.relation,
      required this.signOutDate,
      required this.type,
      required this.updatedUserId,
      required this.useFerry
    });
    
    Employee.empty();

    factory Employee.formJson(Map<String, dynamic> json){
      return Employee(
        address: json["address"], 
        bankAccount: json["bankAccount"], 
        bankAccountType: json["bankAccountType"], 
        basicSalary: json["basicSalary"], 
        cardId: json["cardId"], 
        companyId: json["companyId"], 
        companyType: json["companyType"], 
        confirmPassword: json["confirmPassword"], 
        contactName: json["contactName"], 
        contactPhone: json["contactPhone"], 
        contractNo: json["contractNo"], 
        createdUserId: json["createdUserId"], 
        dateOfBirth: json["dateOfBirth"], 
        department: json["department"], 
        departmentName: json["departmentName"], 
        divisionName: json["divisionName"], 
        email: json["email"], 
        employeeId: json["employeeId"], 
        employeeName: json["employeeName"], 
        employeeType: json["employeeType"], 
        file: json["file"], 
        gender: json["gender"], 
        graduateDegree: json["graduateDegree"], 
        graduateUniversity: json["graduateUniversity"], 
        homeAddress: json["homeAddress"], 
        iqTestRemark: json["iqTestRemark"], 
        jlpt: json["jlpt"], 
        joinDate: json["joinDate"], 
        languageSkill: json["languageSkill"], 
        macAddress: json["macAddress"], 
        managerId: json["managerId"], 
        managerName: json["managerName"], 
        maritalStatus: json["maritalStatus"], 
        newPassword: json["newPassword"], 
        nrc: json["nrc"], 
        nrcDob: json["nrcDob"], 
        officeEmail: json["officeEmail"], 
        password: json["password"], 
        pcNo: json["pcNo"], 
        pcPassword: json["pcPassword"], 
        personalInfoForm: json["personalInfoForm"], 
        phone: json["phone"], 
        photo: json["photo"], 
        position: json["position"], 
        positionStartDate: json["positionStartDate"], 
        relation: json["relation"], 
        signOutDate: json["signOutDate"], 
        type: json["type"], 
        updatedUserId: 
        json["updatedUserId"], 
        useFerry: json["useFerry"]
        );

    }
    Map<String, dynamic> toJson(){
      return {
        "address":  address, 
        "bankAccount":  bankAccount, 
        "bankAccountType":  bankAccountType, 
        "basicSalary":  basicSalary, 
        "cardId":  cardId, 
        "companyId":  companyId, 
        "companyType":  companyType, 
        "confirmPassword":  confirmPassword, 
        "contactName":  contactName, 
        "contactPhone":  contactPhone, 
        "contractNo":  contractNo, 
        "createdUserId":  createdUserId, 
        "dateOfBirth":  dateOfBirth, 
        "department":  department, 
        "departmentName":  departmentName, 
        "divisionName":  divisionName, 
        "email":  email, 
        "employeeId":  employeeId, 
        "employeeName":  employeeName, 
        "employeeType":  employeeType, 
        "file":  file, 
        "gender":  gender, 
        "graduateDegree":  graduateDegree, 
        "graduateUniversity":  graduateUniversity, 
        "homeAddress":  homeAddress, 
        "iqTestRemark":  iqTestRemark, 
        "jlpt":  jlpt, 
        "joinDate":  joinDate, 
        "languageSkill":  languageSkill, 
        "macAddress":  macAddress, 
        "managerId":  managerId, 
        "managerName":  managerName, 
        "maritalStatus":  maritalStatus, 
        "newPassword":  newPassword, 
        "nrc":  nrc, 
        "nrcDob":  nrcDob, 
        "officeEmail":  officeEmail, 
        "password":  password, 
        "pcNo":  pcNo, 
        "pcPassword":  pcPassword, 
        "personalInfoForm":  personalInfoForm, 
        "phone":  phone, 
        "photo":  photo, 
        "position":  position, 
        "positionStartDate":  positionStartDate, 
        "relation":  relation, 
        "signOutDate":  signOutDate, 
        "type":  type, 
        "updatedUserId":  
        updatedUserId, 
        "useFerry":  useFerry
      };
    }
}