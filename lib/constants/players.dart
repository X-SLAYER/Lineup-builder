import 'package:flutter/material.dart';
import 'package:lineup_builder/models/player_positions.dart';
import 'package:lineup_builder/widgets/main.dart';

List<Player> players = [
  Player(
    coordinates: PlayerPosition(Offset(161.3, 640.6)),
    position: 'GK',
    color: Colors.green,
  ),
  //-------------
  Player(
    coordinates: PlayerPosition(Offset(226.7, 598.3)),
    position: 'DF',
    color: Colors.brown[400],
  ),
  Player(
    coordinates: PlayerPosition(Offset(93.4, 601.8)),
    position: 'DF',
    color: Colors.brown[400],
  ),
  Player(
    coordinates: PlayerPosition(Offset(303.1, 543.9)),
    position: 'RB',
    color: Colors.yellow[600],
  ),
  Player(
    coordinates: PlayerPosition(Offset(12.5, 552.4)),
    position: 'LB',
    color: Colors.yellow[600],
  ),
  //-------------
  Player(
    coordinates: PlayerPosition(Offset(160.3, 489.3)),
    position: 'MD',
    color: Colors.red,
  ),
];
