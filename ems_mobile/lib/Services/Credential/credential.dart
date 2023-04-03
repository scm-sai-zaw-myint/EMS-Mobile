import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Credential {
  String? employeeId;
  String? employeeName;
  int? employeeType;
  String? token;

  static const storage = FlutterSecureStorage();

  Credential({
    this.employeeId,
    this.employeeName,
    this.employeeType,
    this.token,
  });

  static void setEmployeeId(employeeId) async {
    await storage.write(key: "employeeId", value: employeeId);
  }

  static void setEmployeeName(employeeName) async {
    await storage.write(key: "employeeName", value: employeeName);
  }

  static void setEmployeeType(employeeType) async {
    await storage.write(key: "employeeType", value: employeeType.toString());
  }

  static void setToken(token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<Credential> getCredential() async {
    final employeeId = await storage.read(key: "employeeId");
    final employeeName = await storage.read(key: "employeeName");
    final employeeType = await storage.read(key: "employeeType");
    final token = await storage.read(key: "token");
    return Credential(
      employeeId: employeeId,
      employeeName: employeeName,
      employeeType: int.tryParse(employeeType ?? ''),
      token: token,
    );
  }

  static void clearStorage() async {
    await storage.deleteAll();
  }

  @override
  String toString() {
    return jsonEncode({
      "employeeId": employeeId,
      "employeeName": employeeName,
      "employeeType": employeeType,
      "token": token,
    });
  }
}
