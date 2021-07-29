/*
 * @Author: wangtianji
 * @Date: 2021-07-29 15:30:00
 * @LastEditTime: 2021-07-29 17:45:06
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/08_functional/ext.dart
 */

import 'ssdatepicker.dart';
import 'sbcupertinodatepicker.dart';
import 'sbpopupmenubutton.dart';
import '../demos.dart';

final functions = [
  Demo(
      name: "ssdatepicker",
      route: ssdatepicker.routeName,
      builder: (context) => ssdatepicker()),
  Demo(
      name: "sbcupertinodatepicker",
      route: sbCupertinoDatePicker.routeName,
      builder: (context) => sbCupertinoDatePicker()),
  Demo(
      name: "sbpopupmenubutton",
      route: sbpopupmenubutton.routeName,
      builder: (context) => sbpopupmenubutton()),
];
