/*
 * @Author: wangtianji
 * @Date: 2021-07-29 15:38:11
 * @LastEditTime: 2021-07-29 15:38:12
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /SSFlutter/lib/demos.dart
 */

import 'package:flutter/material.dart';

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({
    required this.name,
    required this.route,
    required this.builder,
  });
}
