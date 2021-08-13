/*
 * @Author: wangtianji
 * @Date: 2021-07-29 15:30:00
 * @LastEditTime: 2021-07-30 10:37:21
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/08_functional/ext.dart
 */

import 'ssdatepicker.dart';
import 'sbcupertinodatepicker.dart';
import 'sbpopupmenubutton.dart';
import 'sbshapeborder.dart';
import '../demos.dart';
import 'sbdraggable.dart';
import 'sbInteractiveViewer.dart';

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
  Demo(
      name: "sbshapeborder",
      route: sbshapeborder.routeName,
      builder: (context) => sbshapeborder()),
  Demo(
      name: "sbdraggable",
      route: sbdraggable.routeName,
      builder: (context) => sbdraggable()),
  Demo(
      name: "sbInteractiveViewer",
      route: InteractiveViewerDemo.routeName,
      builder: (context) => InteractiveViewerDemo()),
];
