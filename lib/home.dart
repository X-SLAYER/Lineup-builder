import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lineup_builder/models/player_positions.dart';
import 'package:lineup_builder/widgets/main.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Player> players = [];

  _readTactics() {
    rootBundle.loadString("assets/tactics/4-3-3.json").then((json) {
      var jsonBody = jsonDecode(json);
      List<dynamic> _players = jsonBody['players'];
      setState(() {
        players.clear();
      });
      _players.forEach((player) {
        setState(() {
          players.add(fromRegex(player.toString()));
        });
      });
    });
  }

  Player fromRegex(String source) {
    List<String> matchs = new RegExp(r'{(\w+): {x:*(.*?), y:*(.*?)}}')
        .firstMatch(source.toString())
        .groups([1, 2, 3]);
    return Player(
      coordinates: PlayerPosition(
          Offset(double.parse(matchs[1]), double.parse(matchs[2]))),
      position: matchs[0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _readTactics();
        },
      ),
      body: SafeArea(
        child: GestureDetector(
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
