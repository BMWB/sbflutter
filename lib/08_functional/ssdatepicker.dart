/*
 * @Author: wangtianji
 * @Date: 2021-07-29 15:30:37
 * @LastEditTime: 2021-07-29 17:40:34
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/08_functional/ssdatepicker.dart
 */

import 'package:flutter/material.dart';

class ssdatepicker extends StatefulWidget {
  ssdatepicker({Key? key}) : super(key: key);

  static String routeName = '/lib/08_functional/ssdatepicker.dart';

  @override
  _ssdatepickerState createState() => _ssdatepickerState();
}

class _ssdatepickerState extends State<ssdatepicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          RaisedButton(
              child: Text('弹出日期组件'),
              onPressed: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2025),
                );
              }),
          RaisedButton(
            child: Text('弹出时间选择器'),
            onPressed: () async {
              var result = showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
            },
          ),
          RaisedButton(
            child: Text('弹出时间选择器'),
            onPressed: () async {
              var result = showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
            },
          )
        ],
      ),
    );
  }
}
