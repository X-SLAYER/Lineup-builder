import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lineup_builder/providers/players_provider.dart';
import 'package:lineup_builder/utils/json_handler.dart';
import 'package:lineup_builder/widgets/bottom_panel.dart';
import 'package:lineup_builder/widgets/main.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey screenShotKey = GlobalKey();

  _readTactics(String squad) async {
    try {
      dynamic formation = await loadFormationFromAssets(squad);
      var playerProvider = Provider.of<PlayersProvider>(context, listen: false);
      List<Player> _players = [];
      formation.forEach((player) {
        _players.add(playerFromJson(player));
      });
      playerProvider.clearAll();
      Future.delayed(Duration(milliseconds: 10), () {
        playerProvider.addAll(_players);
      });
    } catch (e) {
      print(e);
    }
  }

  takescrshot() async {
    RenderRepaintBoundary boundary =
        screenShotKey.currentContext.findRenderObject();
    var image = await boundary.toImage();
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
    File('lineup.png').writeAsBytes(pngBytes);
  }

  @override
  void initState() {
    super.initState();
    _readTactics("4-4-2");
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
        onSave: () async {
          await takescrshot();
        },
      ),
    );
  }
}
