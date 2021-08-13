/*
 * @Author: wangtianji
 * @Date: 2021-07-29 17:30:15
 * @LastEditTime: 2021-07-29 17:39:03
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/08_functional/sbcupertinodatepicker.dart
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sbCupertinoDatePicker extends StatefulWidget {
  sbCupertinoDatePicker({Key? key}) : super(key: key);

  static String routeName = '/lib/08_functional/sbcupertinodatepicker.dart';

  @override
  _sbCupertinoDatePickerState createState() => _sbCupertinoDatePickerState();
}

class _sbCupertinoDatePickerState extends State<sbCupertinoDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              height: 200,
              child: CupertinoDatePicker(
                onDateTimeChanged: (date) {
                  print('$date');
                },
                initialDateTime: DateTime.now(),
              ),
            ),
            Container(
                height: 200,
                child: CupertinoTimerPicker(onTimerDurationChanged: (time) {
                  print('$time');
                })),
          ],
        ));
  }
}
