import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:task_manager/data/models/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: jsonDecode(response.body));
      } else {
        NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }

  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      Response response = await post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body));

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: jsonDecode(response.body));
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }
}
