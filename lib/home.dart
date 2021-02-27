import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lineup_builder/providers/players_provider.dart';
import 'package:lineup_builder/utils/json_handler.dart';
import 'package:lineup_builder/widgets/main.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _readTactics() {
    var playerProvider = Provider.of<PlayersProvider>(context, listen: false);
    playerProvider.clearAll();
    print('Cleared');
    rootBundle.loadString("assets/tactics/4-4-2.json").then((json) {
      var jsonBody = jsonDecode(json);
      List<dynamic> _players = jsonBody['players'];
      _players.forEach((player) {
        playerProvider.addPlayer(player);
      });
    });
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
            child: Consumer<PlayersProvider>(
          builder: (_, playerProvider, __) => Stack(
            children: [
              Stadium(),
              ...playerProvider.players,
              FloatingActionButton(
                  backgroundColor: Colors.yellow,
                  onPressed: () {
                    log(playerToJson(playerProvider.players));
                  }),
            ],
          ),
        )),
      ),
    );
  }
}
