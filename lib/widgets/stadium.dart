import 'package:flutter/material.dart';

class Stadium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/stadium.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
