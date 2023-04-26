import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  final http.Client _api = http.Client();

  final Map<String, String> _headers = {"Content-Type": "application/json"};
  static const storage = FlutterSecureStorage();

  updateHeader() async {
    final token = await storage.read(key: "token");
    if (token != null) {
      _headers["Authorization"] = "Bearer $token";
    }
  }

  Future<http.Response> get(String url) async {
    await updateHeader();
    try {
      return await _api.get(Uri.parse(url), headers: _headers);
    } catch (e) {
      return http.Response(
          jsonEncode({
            "responseCode": 503,
            "timeStamp": null,
            "responseDescription": "Error while fetching api."
          }),
          503);
    }
  }

  Future<http.Response> post(String url, Map<String, dynamic>? body) async {
    await updateHeader();
    try {
      return await _api.post(Uri.parse(url),
          body: jsonEncode(body), headers: _headers);
    } catch (e) {
      return http.Response(
          jsonEncode({
            "responseCode": 503,
            "timeStamp": null,
            "responseDescription": "Error while fetching api."
          }),
          503);
    }
  }

  Future<http.Response> put(String url, Map<String, dynamic> body) async {
    await updateHeader();
    try {
      return await _api.put(Uri.parse(url),
          body: jsonEncode(body), headers: _headers);
    } catch (e) {
      return http.Response(
          jsonEncode({
            "responseCode": 503,
            "timeStamp": null,
            "responseDescription": "Error while fetching api."
          }),
          503);
    }
  }

  Future<http.Response> delete(String url) async {
    await updateHeader();
    try {
      return await _api.delete(Uri.parse(url), headers: _headers);
    } catch (e) {
      return http.Response(
          jsonEncode({
            "responseCode": 503,
            "timeStamp": null,
            "responseDescription": "Error while fetching api."
          }),
          503);
    }
  }
  //form data requests

  Future<http.Response?>? multipartRequest(String url, Map<String, dynamic> data, PlatformFile? pFile) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    final token = await storage.read(key: "token");
    request.headers.addAll({
      "Authorization": "Bearer ${token!}"
    });
    Map<String, String> requestData = data.map((key, value) => MapEntry("\"$key\"", jsonEncode(value)));
    // print(requestData);
    request.fields.addAll(requestData);
    if(pFile != null){
      final file = File(pFile.path!);
      final stream = http.ByteStream(file.openRead());
      final length = await file.length();
      final multipartFile = http.MultipartFile(
        'attachFile',
        stream,
        length,
        filename: pFile.name,
        contentType: _getContentType(pFile),
      );
      request.files.add(multipartFile);
    }
    try {
      final response = await request.send();
      return http.Response(await response.stream.bytesToString(), response.statusCode);
    } catch (e) {
      return http.Response(
          jsonEncode({
            "responseCode": 503,
            "timeStamp": null,
            "responseDescription": "Error while fetching api."
          }),
          503);
    }

  }

  MediaType _getContentType(PlatformFile file) {
    // Get the file extension
    String? extension = file.extension;

    // If the file has an extension, use it to detect the MIME type
    if (extension!=null) {
      final mimeType = lookupMimeType(extension);
      if (mimeType != null) {
        return MediaType.parse(mimeType);
      }
    }

    // If the MIME type couldn't be detected based on the extension,
    // read the first few bytes of the file and use them to detect
    // the MIME type.
    final mimeType = lookupMimeType(file.name, headerBytes: file.bytes!.toList());
    if (mimeType != null) {
      return MediaType.parse(mimeType);
    }

    // If the MIME type still couldn't be detected, return a default value.
    return MediaType.parse('application/octet-stream');
  }
}
