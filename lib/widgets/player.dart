import 'package:flutter/material.dart';
import 'package:lineup_builder/constants/text_styles.dart';

import 'mailot.dart';

// ignore: must_be_immutable
class Player extends StatefulWidget {
  Offset coordinates;

  Player({@required this.coordinates});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  TextEditingController controller = TextEditingController(text: 'Player');
  GlobalKey _key = GlobalKey();
  double top, left;
  double xOff, yOff;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    top = widget.coordinates.dy;
    left = widget.coordinates.dx;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
    return Positioned(
      key: _key,
      top: top,
      left: left,
      child: Draggable(
        child: _playerSpot(),
        feedback: _playerSpot(),
        childWhenDragging: Container(),
        onDraggableCanceled: (_, drag) {
          setState(
            () {
              top = drag.dy - yOff;
              left = drag.dx - xOff;
              widget.coordinates = Offset(left, top);
            },
          );
        },
      ),
    );
  }

  Widget _playerSpot() => Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            CustomPaint(
              size: Size(45, (45 * 1.0680100755667505).toDouble()),
              painter: PlayerMailot(),
            ),
            SizedBox(height: 8.0),
            SizedBox(
              child: _playerName(),
              width: MediaQuery.of(context).size.width * 0.2,
            ),
          ],
        ),
      );

  Widget _playerName() => EditableText(
        maxLines: 1,
        textAlign: TextAlign.center,
        backgroundCursorColor: Colors.amber,
        cursorColor: Colors.green,
        style: playerName(),
        focusNode: FocusNode(),
        controller: controller,
      );
}
