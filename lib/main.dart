import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomImplicitAnimation(),
      ),
    );
  }
}

class CustomImplicitAnimation extends StatefulWidget {
  @override
  _CustomImplicitAnimationState createState() =>
      _CustomImplicitAnimationState();
}

class _CustomImplicitAnimationState extends State<CustomImplicitAnimation> {
  double _angle = 0;
  double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TweenAnimationBuilder<double>(
            duration: Duration(seconds: 2),
            tween: Tween(begin: 0, end: _angle),
            child: Container(
              height: 200,
              width: 300,
              color: Colors.black,
            ),
            builder: (_, double angle, Widget child) => Transform.rotate(
              angle: angle,
              child: child,
            ),
          ),
          Slider(
            value: _currentValue,
            onChanged: (value) {
              setState(() {
                _angle = value;
                _currentValue = value;
              });
            },
            max: math.pi * 2,
          ),
        ],
      ),
    );
  }
}
