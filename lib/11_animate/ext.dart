/*
 * @Author: your name
 * @Date: 2021-07-28 11:13:38
 * @LastEditTime: 2021-08-09 10:40:19
 * @LastEditors: wangtianji
 * @Description: In User Settings Edit
 * @FilePath: /sbflutter/lib/11_animate/ext.dart
 */

import 'package:flutter/material.dart';
import 'animated_controller.dart';
import 'animated_tweens.dart';
import 'animated_container.dart';
import 'animated_page_route.dart';

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
  Demo(
      name: "AnimatedContainerDemo",
      route: AnimatedContainerDemo.routeName,
      builder: (context) => AnimatedContainerDemo()),
  Demo(
      name: "animated_page_route",
      route: PageRouteBuilderDemo.routeName,
      builder: (context) => PageRouteBuilderDemo()),
];

final animatespages = [
  MaterialPage(key: ValueKey("animatecontroller"), child: animatedController()),
  MaterialPage(key: ValueKey("animatedTweents"), child: animatedTweents()),
];
