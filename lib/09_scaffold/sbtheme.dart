/*
 * @Author: wangtianji
 * @Date: 2021-07-30 14:46:04
 * @LastEditTime: 2021-07-30 14:46:05
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/09_scaffold/sbtheme.dart
 */

import 'package:flutter/material.dart';

class sbtheme extends StatelessWidget {
  const sbtheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData(),
    );
  }
}
