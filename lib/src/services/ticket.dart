import 'package:http/http.dart';
import 'package:tickety_app/src/services/constants.dart';
import 'dart:convert';

class TicketService {

  static Future getBusTickets() async {
    try {
      Response res = await get(Constants.buses);
      dynamic jsonData;
      if(res.statusCode == 200) {
        jsonData = json.decode(res.body);
        List buses = jsonData['buses'].toList();
        return Future.value(buses);
      }else {
        Future.value(false);
      }
    } catch (err) {
      return Future.value(false);
    }
  }
  
  static Future getTrainTickets() async {
    try {
      Response res = await get(Constants.trains);
      dynamic jsonData;
      if(res.statusCode == 200) {
        jsonData = json.decode(res.body);
        List trains = jsonData['trains'].toList().sublist(0,16);
        return Future.value(trains);
      }else {
        Future.value(false);
      }
    } catch (err) {
      return Future.value(false);
    }
  }
}