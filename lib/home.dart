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
  Future<void> _readTactics(String squad) async {
    var playerProvider = Provider.of<PlayersProvider>(context, listen: false);
    // playerProvider.clearAll();
    var json = await rootBundle.loadString("assets/tactics/$squad.json");
    var jsonBody = await jsonDecode(json);
    List<dynamic> _players = jsonBody['players'];
    _players.forEach((player) {
      playerProvider.addPlayer(player);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Provider.of<PlayersProvider>(context, listen: false).clearAll();
          await _readTactics("4-4-2");
        },
      ),
      body: SafeArea(
        child: Consumer<PlayersProvider>(
          builder: (_, playerProvider, __) => Container(
            height: double.infinity,
            width: double.infinity,
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
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('4-2-2'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.contact_mail_outlined),
                  SizedBox(width: 10.0),
                  FlatButton(
                      onPressed: () async {
                        Provider.of<PlayersProvider>(context, listen: false)
                            .clearAll();
                        await _readTactics("4-2-3-1");
                      },
                      child: Text("Save"),
                      color: Colors.yellow)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
