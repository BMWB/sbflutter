/*
 * @Author: your name
 * @Date: 2021-07-28 11:13:38
 * @LastEditTime: 2021-07-30 14:07:01
 * @LastEditors: wangtianji
 * @Description: In User Settings Edit
 * @FilePath: /sbflutter/lib/11_animate/ext.dart
 */

import 'package:flutter/material.dart';
import 'animated_controller.dart';
import 'animated_tweens.dart';

import '../demos.dart';

final animates = [
  Demo(
      name: "AnimatedController",
      route: animatedController.routeName,
      builder: (context) => const animatedController()),
  Demo(
      name: "animatedTweents",
      route: animatedTweents.routeName,
      builder: (context) => const animatedTweents()),
];

final animatespages = [
  MaterialPage(key: ValueKey("animatecontroller"), child: animatedController()),
  MaterialPage(key: ValueKey("animatedTweents"), child: animatedTweents()),
];
