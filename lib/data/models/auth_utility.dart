import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/models/login_model.dart';

class AuthUtility {
  AuthUtility._();
  static LoginModel userinfo = LoginModel();
  static Future<void> saveUserInfo(LoginModel model) async {
    SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    sharedprefs.setString('user-data', jsonEncode(model.toJson()));
    userinfo = model;
  }

  static Future<LoginModel> getUserInfo() async {
    SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    String value = sharedprefs.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    sharedprefs.clear();
    // delete user
  }

  static Future<bool> checkifUserLoggedIn() async {
    SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    bool Loggedin = sharedprefs.containsKey('user-data');
    if (Loggedin) {
      userinfo = await getUserInfo();
    }
    return Loggedin;
  }
}
