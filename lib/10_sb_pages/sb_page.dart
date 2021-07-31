/*
 * @Author: wangtianji
 * @Date: 2021-07-31 10:49:00
 * @LastEditTime: 2021-07-31 11:13:21
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/10_sb_pages/sb_page.dart
 */

import 'package:flutter/material.dart';
import 'package:sbflutter/10_sb_pages/data/sb.dart';
import 'data/sb.dart';

class SBPage extends Page {
  final sb ss;

  SBPage({
    required this.ss,
    sb? sb,
  }) : super(key: ValueKey(ss.route));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(settings: this, builder: allRoutes[ss.route]!);
  }
}
