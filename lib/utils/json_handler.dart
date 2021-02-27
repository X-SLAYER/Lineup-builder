import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lineup_builder/widgets/main.dart';

Player playerFromJson(dynamic source) {
  return Player(
    coordinates: Offset(
      source['x'],
      source['y'],
    ),
  );
}

playerToJson(List<Player> players) {
  final Map<String, dynamic> _players = new Map<String, dynamic>();
  _players['players'] = players.map((player) => _toJson(player)).toList();
  return jsonEncode(_players);
}

Map<String, dynamic> _toJson(Player player) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['x'] = player.tempOffset.dx;
  data['y'] = player.tempOffset.dy;
  return data;
}
