/*
 * @Author: your name
 * @Date: 2021-07-28 14:18:04
 * @LastEditTime: 2021-07-30 18:25:06
 * @LastEditors: wangtianji
 * @Description: In User Settings Edit
 * @FilePath: /sbflutter/lib/10_navigator/ext.dart
 */

import 'sspush.dart';
import 'abcde/PageA.dart';

import '../demos.dart';
import '../09_scaffold/sbtheme.dart';

final navigators = [
  Demo(name: "sspush", route: sspush.routeName, builder: (context) => sspush()),
  Demo(
      name: "PageA",
      route: PageA.routeName,
      builder: (context) => PageA("dsfgasdg")),
  Demo(
      name: "sbtheme",
      route: sbtheme.routeName,
      builder: (context) => sbtheme()),
];
