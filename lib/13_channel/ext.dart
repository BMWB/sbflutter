/*
 * @Author: wangtianji
 * @Date: 2021-07-29 16:09:13
 * @LastEditTime: 2021-07-29 16:12:16
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /SSFlutter/lib/13_channel/ext.dart
 */

import '../demos.dart';
import 'basicmessage_channel.dart';
import 'event_channel.dart';
import 'method_channel.dart';

final channels = [
  Demo(
      name: "bascicmessagechannel",
      route: bascicmessagechannel.routeName,
      builder: (context) => bascicmessagechannel()),
  Demo(
      name: "eventchannel",
      route: eventchannel.routeName,
      builder: (context) => eventchannel()),
  Demo(
      name: "methodchannel",
      route: methodchannel.routeName,
      builder: (context) => methodchannel()),
];
