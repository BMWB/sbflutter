/*
 * @Author: wangtianji
 * @Date: 2021-07-29 18:25:58
 * @LastEditTime: 2021-07-29 18:28:12
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/08_functional/sbdraggable.dart
 */

import 'package:flutter/material.dart';

class sbdraggable extends StatefulWidget {
  sbdraggable({Key? key}) : super(key: key);
  static String routeName = '/lib/08_functional/sbdraggable.dart';

  @override
  _sbdraggableState createState() => _sbdraggableState();
}

class _sbdraggableState extends State<sbdraggable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Draggable(
          child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Text(
              '孟',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          feedback: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Text(
              '孟',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
