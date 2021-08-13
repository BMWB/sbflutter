/*
 * @Author: your name
 * @Date: 2021-07-28 09:56:09
 * @LastEditTime: 2021-07-28 10:01:23
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/scrollview/sssingleChildScrollView.dart
 */

import 'package:flutter/material.dart';

class sssingleChildScrollView extends StatelessWidget {
  const sssingleChildScrollView({Key? key}) : super(key: key);

  static String routeName = '/lib/scrollview/sssingleChildScrollView.dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(50, (index) {
            return Container(
              height: 150,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }).toList(),
        ),
      ),
    );
  }
}
