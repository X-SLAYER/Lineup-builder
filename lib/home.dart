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

import 'constants/formation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey screenShotKey = GlobalKey();

  _readTactics(String squad) async {
    try {
      dynamic formation = await loadFromAssets(squad);
      var playerProvider = Provider.of<PlayersProvider>(context, listen: false);
      List<Player> _players = [];
      print(formation);
      formation.forEach((player) {
        _players.add(playerFromJson(player));
      });
      playerProvider.clearAll();
      Future.delayed(Duration(milliseconds: 5), () {
        playerProvider.addAll(_players);
      });
    } catch (e) {
      print(e);
    }
  }

  takescrshot() async {
    RenderRepaintBoundary boundary =
        screenShotKey.currentContext.findRenderObject();
    // var image = await boundary.toImage();
  }

  Future<dynamic> loadFromAssets(String squad) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _readTactics("4-4-2");
        },
      ),
      body: SafeArea(
        child: Consumer<PlayersProvider>(
          builder: (_, provider, child) => Container(
            height: double.infinity,
            width: double.infinity,
            child: RepaintBoundary(
              key: screenShotKey,
              child: Stack(
                children: [
                  Stadium(),
                  ...provider.players,
                  FloatingActionButton(
                      backgroundColor: Colors.yellow,
                      onPressed: () {
                        log(playerToJson(provider.players));
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
