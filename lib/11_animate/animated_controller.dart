/*
 * @Author: ytj
 * @Date: 2021-07-15 17:06:33
 * @LastEditTime: 2021-07-15 18:34:23
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/animate/animated_controller.dart
 */
import 'package:flutter/material.dart';

class animatedController extends StatefulWidget {
  const animatedController({Key? key}) : super(key: key);
  static String routeName = '/lib/animate/animated_controller.dart';

  @override
  animatedControllerState createState() => animatedControllerState();
}

class animatedControllerState extends State<animatedController>
    with SingleTickerProviderStateMixin {
  double _size = 100;

  static const Duration _duration = Duration(seconds: 1);

  late final AnimationController controller;
  @override
  void initState() {
    super.initState();
    // controller = AnimationController(vsync: this, duration: _duration)
    //   ..addListener(() {
    //     setState(() {
    //       _size = 100 + 100 * controller.value;
    //       // _size = controller.value;
    //     });
    //   });

    controller = AnimationController(
        vsync: this, duration: _duration, lowerBound: 100, upperBound: 200)
      ..addListener(() {
        setState(() {
          _size = controller.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: Container(
            height: _size,
            width: _size,
            color: Colors.deepOrange[700],
            alignment: Alignment.center,
            child: Text(
              "点我变大",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
