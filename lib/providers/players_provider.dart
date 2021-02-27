import 'package:flutter/cupertino.dart';
import 'package:lineup_builder/utils/json_handler.dart';
import 'package:lineup_builder/widgets/player.dart';

class PlayersProvider extends ChangeNotifier {
  List<Player> _players = [];

  List<Player> get players => _players;

  clearAll() {
    _players.clear();
    notifyListeners();
  }

  addPlayer(dynamic source) {
    _players.add(playerFromJson(source));
    notifyListeners();
  }
}
