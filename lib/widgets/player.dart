import 'package:flutter/material.dart';
import 'package:lineup_builder/constants/text_styles.dart';
import 'package:lineup_builder/models/player_positions.dart';

import 'mailot.dart';

class Player extends StatefulWidget {
  final PlayerPosition coordinates;
  final String position;
  final Color color;

  const Player({this.coordinates, this.position, this.color});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  GlobalKey _key = GlobalKey();
  double top, left;
  double xOff, yOff;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    top = widget.coordinates.offset.dy;
    left = widget.coordinates.offset.dx;
    super.initState();
  }

  void _getRenderOffsets() {
    final RenderBox renderBoxWidget = _key.currentContext.findRenderObject();
    final offset = renderBoxWidget.localToGlobal(Offset.zero);

    yOff = offset.dy - this.top;
    xOff = offset.dx - this.left;
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      key: _key,
      duration: Duration(milliseconds: 0),
      top: top,
      left: left,
      child: Draggable(
          child: _playerSpot(),
          feedback: _playerSpot(),
          childWhenDragging: Container(),
          onDragEnd: (drag) {
            setState(() {
              top = drag.offset.dy - yOff;
              left = drag.offset.dx - xOff;
            });
          }),
    );
  }

  Widget _playerSpot() => Material(
      color: Colors.transparent,
      child: Column(
        children: [
          CustomPaint(
            size: Size(50, (50 * 1.0680100755667505).toDouble()),
            painter: RPSCustomPainter(),
          ),
          SizedBox(height: 8.0),
          _playerName(),
        ],
      ));

  Widget _playerName() => Text(
        "Player",
        textAlign: TextAlign.center,
        style: playerName(),
      );
}

// Column(
//           children: [
//             Container(
//               width: 45.0,
//               height: 45.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: widget.color,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.white.withOpacity(0.5),
//                     spreadRadius: 4,
//                     blurRadius: 7,
//                     offset: Offset(1, 1),
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Text(widget.position),
//               ),
//             ),
//             SizedBox(height: 8.0),
//             _playerName()
//           ],
//         ),
