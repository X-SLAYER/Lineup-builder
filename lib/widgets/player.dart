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
    return Positioned(
      top: widget.coordinates.offset.dy,
      left: widget.coordinates.offset.dx,
      child: Draggable(
        child: _player(),
        feedback: _player(),
        childWhenDragging: Container(),
        onDraggableCanceled: (_, Offset offset) {
          print(offset);
          setState(() {
            widget.coordinates.offset = offset;
          });
        },
      ),
    );
  }

  Widget _player() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _playerSpot(),
          SizedBox(height: 5.0),
          // _playerName(),
        ],
      );

  Widget _playerSpot() => Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
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
      );

  Widget _playerName() => EditableText(
        controller: _controller,
        cursorColor: Colors.white,
        textAlign: TextAlign.center,
        backgroundCursorColor: Colors.white,
        focusNode: _focusNode,
        style: playerName(),
      );
}
