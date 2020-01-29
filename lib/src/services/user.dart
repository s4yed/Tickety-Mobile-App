import 'dart:convert';
import 'package:tickety_app/src/services/auth.dart';
import 'package:http/http.dart';
import 'package:tickety_app/src/services/constants.dart';

class UserService {

  static Future addTicket(Map ticket) async {
    try {  
      String token = await AuthService.getToken();
      Map headers = Constants.headers(token)['jsonHeader'];
      Response res = await post(Constants.addTicket, headers: headers, body: json.encode(ticket));
      dynamic jsonData;
      if(res.statusCode == 200 || res.statusCode == 202) {
        jsonData = json.decode(res.body);
        return Future.value(jsonData);
      }else {
        print('Error: ${res.body}');
        return Future.value(false);
      }
    } catch (err) {
      print(err);
    }
  }

  static Future removeTicket(ticket) async {
    try {  
      String token = await AuthService.getToken();
      Map headers = Constants.headers(token)['jsonHeader'];
      Response res = await post(Constants.removeTicket, headers: headers, body: json.encode(ticket));
      dynamic jsonData;
      if(res.statusCode == 200 || res.statusCode == 202) {
        jsonData = json.decode(res.body);
        return Future.value(jsonData);
      }else {
        print('Error: ${res.body}');
        return Future.value(false);
      }
    } catch (err) {
      print(err);
    }
  }

  static Future getUserData() async {
    try {  
      String token = await AuthService.getToken();
      Map headers = Constants.headers(token)['jsonHeader'];
      Response res = await get(Constants.userData, headers: headers);
      dynamic jsonData;
      if(res.statusCode == 200 || res.statusCode == 301) {
        jsonData = json.decode(res.body);
        return Future.value(jsonData['user']);
      }else {
        print('Error: ${res.body}');
        return Future.value(false);
      }
    } catch (err) {
      print(err);
    }
  }
}