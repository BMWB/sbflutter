/*
 * @Author: wangtianji
 * @Date: 2021-07-30 14:46:04
 * @LastEditTime: 2021-07-30 18:18:28
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/09_scaffold/sbtheme.dart
 */

import 'package:flutter/material.dart';

class sbtheme extends StatelessWidget {
  const sbtheme({Key? key}) : super(key: key);

  static String routeName = '/lib/09_scaffold/sbtheme.dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(
          color: Theme.of(context).primaryColor,
          width: 300,
          height: 50,
        ),
        Container(
          color: Theme.of(context).accentColor,
          width: 300,
          height: 50,
        ),
        Container(
          color: Theme.of(context).cardColor,
          width: 300,
          height: 50,
        ),
        Container(
          color: Theme.of(context).shadowColor,
          width: 300,
          height: 50,
        ),
        Container(
          color: Theme.of(context).splashColor,
          width: 300,
          height: 50,
        ),
        Container(
          color: Theme.of(context).selectedRowColor,
          width: 300,
          height: 50,
        ),
        RaisedButton(child: Text('弹出日期组件'), onPressed: () {}),
      ]),
    );
  }
}
