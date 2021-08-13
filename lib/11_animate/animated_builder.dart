/*
 * @Author: wangtianji
 * @Date: 2021-08-11 09:51:30
 * @LastEditTime: 2021-08-11 10:03:05
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/11_animate/animated_builder.dart
 */

import 'package:flutter/material.dart';

class AnimatedBuilderDemo extends StatefulWidget {
  AnimatedBuilderDemo({Key? key}) : super(key: key);

  static const String routeName = '/lib/11_animate/animated_builder.dart';

  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  static const Color beginColor = Colors.deepPurple;
  static const Color endColor = Colors.deepOrange;
  Duration duration = const Duration(milliseconds: 800);
  late AnimationController controller;
  late Animation<Color?> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: duration);
    animation =
        ColorTween(begin: beginColor, end: endColor).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedBuilder"),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return MaterialButton(
                  color: animation.value,
                  height: 50,
                  minWidth: 100,
                  child: child,
                  onPressed: () {
                    if (controller.status == AnimationStatus.completed) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                  });
            },
            child: const Text(
              "change Color",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
