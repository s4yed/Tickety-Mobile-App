import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:tickety_app/src/services/constants.dart';
import 'dart:convert';

class AuthService {
  static String token;
  static SharedPreferences prefs;

  static Future login(Map data) async {
    try {
      Response res = await post(Constants.login, body: data);
      dynamic jsonData;
      if(res.statusCode == 200) {
        jsonData = json.decode(res.body);
        prefs = await SharedPreferences.getInstance();
        prefs.setString('_token', jsonData['token']);
        return Future.value(jsonData['success']);
      } else {
        return Future.value(false);
      }
    } catch (err) {
      print(err);
    }
  }

  static Future signup(Map data) async {
    try {
      Response res = await post(Constants.signup, body: data);
      dynamic jsonData;
      if(res.statusCode == 200) {
        jsonData = json.decode(res.body);
        prefs = await SharedPreferences.getInstance();
        prefs.setString('_token', jsonData['token']);
        return Future.value(jsonData['success']);
      } else {
        return Future.value(false);
      }
    } catch (err) {
      print(err);
    }
  }

  static void logout(BuildContext context) {
    prefs.remove('_token');
    prefs.clear();
    token = null;
    Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
  }

  static Future isAuthenticated() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('_token');
    if(token != null)
      return Future.value(true);
    return Future.value(false);
  }

  static Future getToken() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('_token');
    return Future.value(token);
  }
}