/*
 * @Author: your name
 * @Date: 2021-07-22 18:01:55
 * @LastEditTime: 2021-07-23 09:58:16
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/channel/basicmessage_channel.dart
 */
/*
 * @Author: your name
 * @Date: 2021-07-22 10:29:29
 * @LastEditTime: 2021-07-22 10:49:28
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/channel/method_channel.dart
 */
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class eventchannel extends StatefulWidget {
  eventchannel({Key? key}) : super(key: key);

  static String routeName = '/lib/13_channel/event_channel.dart';

  @override
  _eventchannelState createState() => _eventchannelState();
}

class _eventchannelState extends State<eventchannel> {
  var _eventChannel = EventChannel('com.flutter.guide.EventChannel');
  var _data;
  @override
  void initState() {
    super.initState();
    _eventChannel.receiveBroadcastStream().listen(_onData);
  }

  _onData(event) {
    setState(() {
      _data = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('$_data'),
      ),
    );
  }
}
