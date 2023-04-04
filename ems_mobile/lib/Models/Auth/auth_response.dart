import 'dart:convert';

import 'package:ems_mobile/Models/Auth/user.dart';

class AuthResponse{
  double? timestamp;
  int? responseCode;
  String? responseDescription;
  String? token;
  User? userInformation;

  AuthResponse(
  {
    this.timestamp,
    this.responseCode,
    this.responseDescription, 
    this.token, 
    this.userInformation
  }
  );
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final responseCode = json["responseCode"];
    if(responseCode == 200){
        return AuthResponse(
          timestamp: json['timestamp'],
          responseCode: json['responseCode'],
          responseDescription: json['responseDescription'],
          token: json['token'],
          userInformation: User.fromJson(json['userInfomation'])
        );
      }else{
        return AuthResponse(
          timestamp: json['timestamp'],
          responseCode: json['responseCode'],
          responseDescription: json['responseDescription']
        );
      }
  }
  @override
  String toString() {
    return jsonEncode({
      "timestamp": timestamp,
      "responseCode": responseCode,
      "responseDescription": responseDescription,
      "token": token,
      "userInformation": userInformation.toString()
    });
  }
}