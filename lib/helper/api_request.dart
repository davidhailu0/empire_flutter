import "dart:convert";

import "package:get/get.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

import "../util/app_constants.dart";

class APIRequest extends GetxService {
  final SharedPreferences sharedPreferences;
  final int timeoutInSeconds = 30;
  APIRequest({required this.sharedPreferences});
  Future<Response> getRequest(
    String uri,
  ) async {
    String? token = sharedPreferences.getString(AppConstants.accessToken);
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response;
    try {
      response = await http.get(Uri.parse(AppConstants.baseUrl + uri),
          headers: headers);
      var decodedBody = jsonDecode(response.body) as Map;
      if (decodedBody.containsKey("error") &&
          decodedBody["error"] == "jwt expired") {
        _refreshToken();
        response = await http.get(Uri.parse(AppConstants.baseUrl + uri),
            headers: headers);
        decodedBody = jsonDecode(response.body) as Map;
      }

      return Response(
          statusCode: response.statusCode,
          status: decodedBody["status"],
          error: decodedBody["error"],
          message: decodedBody["message"],
          data: decodedBody["data"]);
    } catch (e) {
      print(e);
      return Response(
          statusCode: 404, error: "Please Check Your Internet Connection");
    }
  }

  Future<Response> postRequest(String uri, dynamic body) async {
    String? token = sharedPreferences.getString(AppConstants.accessToken);
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response;
    try {
      response = await http.post(Uri.parse(AppConstants.baseUrl + uri),
          headers: headers, body: jsonEncode(body));
      var decodedBody = jsonDecode(response.body) as Map;
      if (decodedBody.containsKey("error") &&
          decodedBody["error"] == "jwt expired") {
        _refreshToken();
        response = await http.post(Uri.parse(AppConstants.baseUrl + uri),
            headers: headers, body: body);
        decodedBody = jsonDecode(response.body) as Map;
      }
      return Response(
          statusCode: response.statusCode,
          status: decodedBody["status"],
          error: decodedBody["error"],
          message: decodedBody["message"],
          data: decodedBody["data"]);
    } catch (e) {
      print(e);
      return Response(
          statusCode: 404, error: "Please Check Your Internet Connection");
    }
  }

  void _refreshToken() async {
    String refreshToken =
        sharedPreferences.getString(AppConstants.refreshToken)!;
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $refreshToken'
    });
    http.Response response;
    response = await http.get(
        Uri.parse(AppConstants.baseUrl + AppConstants.refreshTokenUrl),
        headers: headers);
    var decodedBody = jsonDecode(response.body);
    String accessToken = decodedBody.data["access-token"];
    await sharedPreferences.setString(AppConstants.accessToken, accessToken);
  }

  Future<Response> postRequestWithFile(
      String uri, dynamic body, String fileName) async {
    String? token = sharedPreferences.getString(AppConstants.accessToken);
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response;
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse(AppConstants.baseUrl + uri));
      request.files.add(await http.MultipartFile.fromPath(
          fileName, body[fileName].toString()));
      request.fields.addAll(body);
      request.headers.addAll(headers);
      var streamedResponse =
          await request.send().timeout(Duration(seconds: timeoutInSeconds));
      response = await http.Response.fromStream(streamedResponse);
      var decodedBody = jsonDecode(response.body) as Map;
      if (decodedBody.containsKey("error") &&
          decodedBody["error"] == "jwt expired") {
        _refreshToken();
        streamedResponse =
            await request.send().timeout(Duration(seconds: timeoutInSeconds));
        response = await http.Response.fromStream(streamedResponse);
        decodedBody = jsonDecode(response.body) as Map;
      }
      return Response(
          statusCode: response.statusCode,
          status: decodedBody["status"],
          error: decodedBody["error"],
          message: decodedBody["message"],
          data: decodedBody["data"]);
    } catch (e) {
      print(e);
      return Response(
          statusCode: 404, error: "Please Check Your Internet Connection");
    }
  }
}

class Response {
  int statusCode;
  String? status;
  String? message;
  String? error;
  dynamic data;
  Response(
      {required this.statusCode,
      this.status,
      this.message,
      this.data,
      this.error});
}
