/*
 * @Author: wangtianji
 * @Date: 2021-07-31 10:26:23
 * @LastEditTime: 2021-07-31 11:31:16
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/10_sb_pages/data/sb.dart
 */

export 'package:sbflutter/13_channel/ext.dart';
export 'package:sbflutter/11_animate/ext.dart';
export 'package:sbflutter/08_functional/ext.dart';
export 'package:sbflutter/07_sliver/ext.dart';
export 'package:sbflutter/06_scrollview/ext.dart';
export 'package:sbflutter/10_navigator/ext.dart';
export 'package:sbflutter/05_eventbus/ext.dart';

import 'package:sbflutter/13_channel/ext.dart';
import 'package:sbflutter/11_animate/ext.dart';
import 'package:sbflutter/08_functional/ext.dart';
import 'package:sbflutter/07_sliver/ext.dart';
import 'package:sbflutter/06_scrollview/ext.dart';
import 'package:sbflutter/10_navigator/ext.dart';
import 'package:sbflutter/05_eventbus/ext.dart';

import 'package:sbflutter/demos.dart';

import 'package:flutter/material.dart';

class sb {
  // final int id;

  // final String name;

  final String route;

  sb(this.route);
}

final animatedDemoRoutes =
    Map.fromEntries(Demos.map((e) => MapEntry(e.route, e.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...animatedDemoRoutes,
};

final Demos = [
  ...animates,
  ...scrolls,
  ...functions,
  ...slivers,
  ...navigators,
  ...channels,
  ...eventbus,
];
