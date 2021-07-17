import 'package:flutter/cupertino.dart';
import 'package:lineup_builder/utils/json_handler.dart';
import 'package:lineup_builder/widgets/player.dart';

class PlayersProvider extends ChangeNotifier {
  List<Player> _players = [];
  Color _color = Color(0xff000000);

  List<Player> get players => _players;
  Color get color => _color;

  clearAll() {
    _players.clear();
    notifyListeners();
  }

  addPlayer(dynamic source) {
    _players.add(playerFromJson(source));
    notifyListeners();
  }

  addAll(List<Player> players) {
    _players.addAll(players);
    notifyListeners();
  }

  setColor(Color color) {
    _color = color;
    notifyListeners();
  }
}
