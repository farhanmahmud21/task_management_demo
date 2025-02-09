import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart%20';
import 'package:http/http.dart';
import 'package:task_manager/Ui/Screens/LoginScreen.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/data/models/auth_utility.dart';
import 'package:task_manager/data/models/network_response.dart';

class NetworkCaller {
//this for get request

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url),
          headers: {'token': AuthUtility.userinfo.token.toString()});

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        gotoLogin();
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }

//this for post request

  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      Response response = await post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'token': AuthUtility.userinfo.token.toString()
          },
          body: jsonEncode(body));

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        gotoLogin();
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }

  void gotoLogin() async {
    await AuthUtility.clearUserInfo();
    Navigator.pushAndRemoveUntil(
        Task_Manager.globalKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }
}
