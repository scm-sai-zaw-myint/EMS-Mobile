import 'package:ems_mobile/Services/Common/config.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ProfileService {
  static Future<void> getProfile() async {
    print("${Config.domainUrl}/employeeProfile");
    final response = await http.get(
        Uri.parse("${Config.domainUrl}/employeeProfile"),
        headers: {'Content-Type': 'Application/json'});
    print(response.body);
  }

// class Login {
//   String? id;
//   String? password;
//   Map<String, dynamic> toJson() {
//     return {
//       'loginId': id,
//       'password': password,
//     };
//   }
// }

// class ResponseBody {
//   final int timeStamp;
//   final int responseCode;
//   final String responseDescription;
//   final String? token;
//   final String userInformation;

//   const ResponseBody({
//     required this.responseCode,
//     required this.responseDescription,
//     required this.token,
//     required this.userInformation,
//     required this.timeStamp,
//   });

//   factory ResponseBody.fromJson(Map<String, dynamic> json) {
//     return ResponseBody(
//         responseCode: json['responseCode'],
//         responseDescription: json['responseDescription'],
//         token: json['token'] ?? "",
//         userInformation: json['userInformation'] ?? "",
//         timeStamp: json['timeStamp']);
//   }
// }
}
