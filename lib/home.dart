import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lineup_builder/providers/players_provider.dart';
import 'package:lineup_builder/utils/json_handler.dart';
import 'package:lineup_builder/widgets/bottom_panel.dart';
import 'package:lineup_builder/widgets/main.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey screenShotKey = GlobalKey();

  _readTactics(String squad) async {
    // Formation.load();
    try {
      var playerProvider = Provider.of<PlayersProvider>(context, listen: false);
      playerProvider.clearAll();
      dynamic formation = await loadOnce(squad);
      formation.forEach((player) {
        playerProvider.addPlayer(player);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> loadOnce(String squad) async {
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

  takescrshot() async {
    RenderRepaintBoundary boundary =
        screenShotKey.currentContext.findRenderObject();
    // var image = await boundary.toImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Provider.of<PlayersProvider>(context, listen: false).clearAll();
          await _readTactics("4-3-3");
        },
      ),
      body: SafeArea(
        child: Consumer<PlayersProvider>(
          builder: (_, playerProvider, child) => Container(
            height: double.infinity,
            width: double.infinity,
            child: RepaintBoundary(
              key: screenShotKey,
              child: Stack(
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
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomPanel(
        onSelect: (tactic) {
          _readTactics(tactic);
        },
        onPressed: () async {
          await _readTactics('4-3-3');
        },
      ),
    );
  }
}
