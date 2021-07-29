/*
 * @Author: your name
 * @Date: 2021-07-28 11:13:38
 * @LastEditTime: 2021-07-28 11:14:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/animate/ext.dart
 */

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
