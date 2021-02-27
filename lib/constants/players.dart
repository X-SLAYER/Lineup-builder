import 'package:flutter/material.dart';
import 'package:lineup_builder/models/player_positions.dart';
import 'package:lineup_builder/widgets/main.dart';

List<Player> players = [
  Player(
    coordinates: PlayerPosition(Offset(159.8, 605.6)),
    position: 'GK',
    color: Colors.green,
  ),
  //-------------
  Player(
    coordinates: PlayerPosition(Offset(103.9, 525.8)),
    position: 'DF',
    color: Colors.brown[400],
  ),
  Player(
    coordinates: PlayerPosition(Offset(216.7, 525.8)),
    position: 'DF',
    color: Colors.brown[400],
  ),
  Player(
    coordinates: PlayerPosition(Offset(292.6, 451.5)),
    position: 'RB',
    color: Colors.yellow[600],
  ),
  Player(
    coordinates: PlayerPosition(Offset(18.5, 451.5)),
    position: 'LB',
    color: Colors.yellow[600],
  ),
  //-------------
  Player(
    coordinates: PlayerPosition(Offset(152.3, 362.5)),
    position: 'MD',
    color: Colors.red,
  ),
  Player(
    coordinates: PlayerPosition(Offset(217.2, 289.1)),
    position: 'MD',
    color: Colors.red,
  ),
  Player(
    coordinates: PlayerPosition(Offset(117.9, 227.0)),
    position: 'MD',
    color: Colors.red,
  ),
  //-------------------
  Player(
    coordinates: PlayerPosition(Offset(61.4, 106.1)),
    position: 'ST',
    color: Colors.red,
  ),
  Player(
    coordinates: PlayerPosition(Offset(258.2, 106.1)),
    position: 'ST',
    color: Colors.red,
  ),
  Player(
    coordinates: PlayerPosition(Offset(154.3, 32.6)),
    position: 'ST',
    color: Colors.red,
  ),
];
