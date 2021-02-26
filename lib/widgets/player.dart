import 'package:flutter/material.dart';
import 'package:lineup_builder/constants/text_styles.dart';
import 'package:lineup_builder/models/player_positions.dart';

class Player extends StatefulWidget {
  final PlayerPosition coordinates;
  final String position;
  final Color color;

  const Player({this.coordinates, this.position, this.color});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  TextEditingController _controller = TextEditingController(text: 'Player');
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 0),
      top: widget.coordinates.offset.dy,
      left: widget.coordinates.offset.dx,
      child: Draggable(
        child: _playerSpot(),
        feedback: _playerSpot(),
        childWhenDragging: Container(),
        onDraggableCanceled: (_, Offset offset) {
          print(offset);
          setState(() {
            widget.coordinates.initCords(offset);
          });
        },
      ),
    );
  }

  Widget _playerSpot() => Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(widget.position),
              ),
            ),
            SizedBox(height: 8.0),
            _playerName()
          ],
        ),
      );

  Widget _playerName() => Text(
        "Player",
        textAlign: TextAlign.center,
        style: playerName(),
      );
}
