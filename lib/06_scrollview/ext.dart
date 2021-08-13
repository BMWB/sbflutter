/*
 * @Author: your name
 * @Date: 2021-07-28 10:49:18
 * @LastEditTime: 2021-07-28 10:50:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/scrollview/ext.dart
 */

import 'sslistview.dart';
import 'ssgridView.dart';
import 'sssingleChildScrollView.dart';
import 'ssPageView.dart';
import 'ssDataTable.dart';

import '../demos.dart';

final scrolls = [
  Demo(
      name: "sslistview",
      route: sslistview.routeName,
      builder: (context) => sslistview()),
  Demo(
      name: "ssgridView",
      route: ssgridView.routeName,
      builder: (context) => ssgridView()),
  Demo(
      name: "sssingleChildScrollView",
      route: sssingleChildScrollView.routeName,
      builder: (context) => sssingleChildScrollView()),
  Demo(
      name: "ssPageView",
      route: ssPageView.routeName,
      builder: (context) => ssPageView()),
  Demo(
      name: "ssDateTable",
      route: ssDateTable.routeName,
      builder: (context) => ssDateTable()),
];
