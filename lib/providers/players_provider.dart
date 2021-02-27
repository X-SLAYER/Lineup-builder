import 'package:flutter/cupertino.dart';
import 'package:lineup_builder/utils/regex_parser.dart';
import 'package:lineup_builder/widgets/player.dart';

class PlayersProvider extends ChangeNotifier {
  List<Player> _players = [];

  List<Player> get players => _players;

  clearAll() {
    _players.clear();
    notifyListeners();
  }

  addPlayer(String source) {
    _players.add(playerFromRegex(source));
    notifyListeners();
  }
}
