
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'config.dart';


class ApiService {
  final http.Client _api;
  
  final Map<String,String>? _headers;
  
  ApiService() : _api = http.Client(),_headers = {"Content-Type": Config.contentType};
  ApiService.authorized(Map<String, String> cheaders) : _api = http.Client(), _headers = cheaders;
  Future<http.Response> get(String url) async {
    try{
      return await _api.get(Uri.parse(url), headers: _headers);
    }catch(e){
      return http.Response(jsonEncode({"code": 400,"data":null, "ok": false, "message": "Error while fetching api."}), 503);
    }
  }
  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    http.Response response;
    try{
      response = await _api.post(Uri.parse(url),body: jsonEncode(body), headers: _headers);
    }catch(e){
      response = http.Response(jsonEncode({"code": 400,"data":null, "ok": false, "message": "Error while fetching api."}), 503);
    }
    return response;
  }
  Future<http.Response> put(String url, Map<String, dynamic> body) async {
    try{
      return await _api.put(Uri.parse(url),body: jsonEncode(body), headers: _headers);
    }catch(e){
      return http.Response(jsonEncode({"code": 400,"data":null, "ok": false, "message": "Error while fetching api."}), 503);
    }
  }
  Future<http.Response> delete(String url) async {
    try{
      return await _api.delete(Uri.parse(url), headers: _headers);
    }catch(e){
      return http.Response(jsonEncode({"code": 400,"data":null, "ok": false, "message": "Error while fetching api."}), 503);
    }
  }
}