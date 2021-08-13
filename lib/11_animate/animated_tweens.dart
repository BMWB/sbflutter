/*
 * @Author: ytj
 * @Date: 2021-07-15 17:06:33
 * @LastEditTime: 2021-07-16 14:12:02
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/animate/animated_controller.dart
 */
import 'package:flutter/material.dart';

class animatedTweents extends StatefulWidget {
  const animatedTweents({Key? key}) : super(key: key);
  static String routeName = '/lib/animate/animated_tweens.dart';

  @override
  animatedTweentsState createState() => animatedTweentsState();
}

class animatedTweentsState extends State<animatedTweents>
    with SingleTickerProviderStateMixin {
  double _size = 100;

  static const Duration _duration = Duration(seconds: 1);
  static const double accountBalance = 1000000;
  late final AnimationController _controller;
  late final Animation<Color?> _animation;
  // late final Animation<double> _animations;

  Color _startColor = Colors.blue;
  Color _endColor = Colors.red;

  Color _color = Colors.yellow.shade600;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        setState(() {
          // _size = 100 + 100 * controller.value;

          // _color = Color.lerp(_startColor, _endColor, controller.value)!;
          // _size = controller.value;
        });
      });

    Animation<Color?> colorTween =
        ColorTween(begin: Colors.amber, end: Colors.cyan).animate(_controller);
    _animation = colorTween;

    // _animations = Tween(begin: 0.0, end: accountBalance).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Controller"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            height: _size,
            width: _size,
            color: _animation.value,
            alignment: Alignment.center,
            child: Text(
              "点我变色",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
