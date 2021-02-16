import 'package:flutter/material.dart';
import 'package:lineup_builder/models/player_positions.dart';

class Player extends StatelessWidget {
  final PlayerPosition coordinates;
  final String position;
  final Color color;

  const Player({this.coordinates, this.position, this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      alignment: Alignment(coordinates.x, coordinates.y),
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(position),
        ),
      ),
    );
  }
}
