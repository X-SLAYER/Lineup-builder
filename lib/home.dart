import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lineup_builder/models/player_positions.dart';
import 'package:lineup_builder/widgets/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Player> players = [
    Player(
      coordinates: PlayerPosition(Offset(10.0, 10.0)),
      position: 'GK',
      color: Colors.green,
    ),
    Player(
      coordinates: PlayerPosition(Offset(10.0, 10.0)),
      position: 'DF',
      color: Colors.blueGrey,
    ),
    Player(
      coordinates: PlayerPosition(Offset(10.0, 10.0)),
      position: 'MD',
      color: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTapDown: (TapDownDetails details) {
            var x = details.globalPosition.dx;
            var y = details.globalPosition.dy;
          },
          child: Stack(
            children: [
              Stadium(),
              ...players,
            ],
          ),
        ),
      ),
    );
  }
}
