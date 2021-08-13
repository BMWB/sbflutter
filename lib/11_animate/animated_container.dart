/*
 * @Author: wangtianji
 * @Date: 2021-08-04 15:26:21
 * @LastEditTime: 2021-08-06 15:56:37
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/11_animate/animated_container.dart
 */
import 'dart:math';
import 'package:flutter/material.dart';

double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class AnimatedContainerDemo extends StatefulWidget {
  AnimatedContainerDemo({Key? key}) : super(key: key);

  static String routeName = '/lib/11_animate/animated_container.dart';

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();

    color = Colors.deepPurple;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
  }

  void change() {
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedContainer"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'change',
              ),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}
