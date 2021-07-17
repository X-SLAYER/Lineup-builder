import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lineup_builder/widgets/main.dart';

Player playerFromJson(dynamic source) {
  return Player(
    coordinates: Offset(
      source['x'],
      source['y'],
    ),
  );
}

///export your custom tactic to a json file
///it might help later if u need to save this on server side or in a local file
playerToJson(List<Player> players) {
  final Map<String, dynamic> _players = new Map<String, dynamic>();
  _players['players'] = players.map((player) => _toJson(player)).toList();
  return jsonEncode(_players);
}

Map<String, dynamic> _toJson(Player player) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['x'] = player.coordinates.dx ?? 0.0;
  data['y'] = player.coordinates.dy ?? 0.0;
  return data;
}

Future<dynamic> loadFormationFromAssets(String squad) async {
  try {
    String json = await rootBundle.loadString("assets/tactics/$squad.json");
    var jsonBody = jsonDecode(json);
    List<dynamic> _players = jsonBody['players'];
    return _players;
  } catch (e) {
    print("error: $e");
  }
}
