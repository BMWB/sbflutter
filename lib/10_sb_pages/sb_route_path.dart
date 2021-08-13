/*
 * @Author: wangtianji
 * @Date: 2021-07-31 10:07:42
 * @LastEditTime: 2021-07-31 10:11:03
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/10_sb_pages/sb_route_path.dart
 */

import 'package:flutter/material.dart';

class SBRoutePath {
  final String? route;

  final bool isUnknown;

  SBRoutePath.home()
      : route = null,
        isUnknown = false;

  SBRoutePath.details(this.route) : isUnknown = false;

  SBRoutePath.unknown()
      : route = null,
        isUnknown = true;

  bool get isHomePage => route == null;

  bool get isDetailsPage => route != null;
}
