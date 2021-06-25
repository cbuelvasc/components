import 'package:flutter/material.dart';
import 'dart:math';

import '../../theme.dart';

class AnimatedContainerScreen extends StatefulWidget {
  AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  _AnimatedContainerScreenState createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = AppTheme.greenColor2;
  BorderRadius _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.panelColor,
      appBar: AppBar(
        title: Text('Animated Container'),
        backgroundColor: AppTheme.panelColor,
        elevation: 10.0,
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
          duration: Duration(milliseconds: 500),
          curve: Curves.bounceInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShape,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeShape() {
    final Random random = Random();
    setState(() {
      this._width = random.nextInt(300).toDouble();
      this._height = random.nextInt(300).toDouble();
      this._color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      this._borderRadius =
          BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
