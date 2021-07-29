/*
 * @Author: your name
 * @Date: 2021-07-28 14:18:04
 * @LastEditTime: 2021-07-29 09:14:26
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/navigator/exd.dart
 */

import 'sspush.dart';
import 'abcde/PageA.dart';

import '../demos.dart';

final navigators = [
  Demo(name: "sspush", route: sspush.routeName, builder: (context) => sspush()),
  Demo(
      name: "PageA",
      route: PageA.routeName,
      builder: (context) => PageA("dsfgasdg")),
];
