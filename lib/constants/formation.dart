import 'dart:convert';

import 'package:flutter/services.dart';

abstract class Formation {
  static Map<String, dynamic> list = {
    "4-3-3": {},
    "4-2-3-1": {},
    "4-4-2": {},
  };

  static Future load() async {
    list.keys.forEach((e) async {
      list[e] = await loadOnce(e);
    });
  }

  static Future<dynamic> loadOnce(String squad) async {
    try {
      String json = await rootBundle.loadString("assets/tactics/$squad.json");
      var jsonBody = jsonDecode(json);
      List<dynamic> _players = jsonBody['players'];
      print(_players);
      return _players;
    } catch (e) {
      print("error: $e");
    }
  }
}
