/*
 * @Author: your name
 * @Date: 2021-07-22 10:29:29
 * @LastEditTime: 2021-07-22 10:49:28
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/channel/method_channel.dart
 */
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class methodchannel extends StatefulWidget {
  methodchannel({Key? key}) : super(key: key);

  static String routeName = '/lib/13_channel/methodchannel.dart';

  @override
  _methodchannelState createState() => _methodchannelState();
}

class _methodchannelState extends State<methodchannel> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
