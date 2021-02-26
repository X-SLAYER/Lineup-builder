import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lineup_builder/widgets/main.dart';

import 'constants/players.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (details) {
          print(Offset(details.localPosition.dx, details.localPosition.dx));
        },
        child: Stack(
          children: [
            Stadium(),
            ...players,
          ],
        ),
      ),
    );
  }
}
