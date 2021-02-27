import 'package:flutter/material.dart';
import 'package:lineup_builder/models/player_positions.dart';
import 'package:lineup_builder/widgets/main.dart';

Player playerFromRegex(String source) {
  List<String> matchs = new RegExp(r'{(\w+): {x:*(.*?), y:*(.*?)}}')
      .firstMatch(source.toString())
      .groups([1, 2, 3]);
  return Player(
    coordinates: PlayerPosition(
        Offset(double.parse(matchs[1]), double.parse(matchs[2]))),
    position: matchs[0],
  );
}
