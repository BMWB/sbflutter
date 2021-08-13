/*
 * @Author: your name
 * @Date: 2021-07-22 18:01:55
 * @LastEditTime: 2021-07-29 16:17:43
 * @LastEditors: wangtianji
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/13_channel/basicmessage_channel.dart
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

class bascicmessagechannel extends StatefulWidget {
  bascicmessagechannel({Key? key}) : super(key: key);

  static String routeName = '/lib/13_channel/basicmessage_channel.dart';

  @override
  _bascicmessagechannelState createState() => _bascicmessagechannelState();
}

class _bascicmessagechannelState extends State<bascicmessagechannel> {
  var channel = BasicMessageChannel(
      'com.flutter.guide.BasicMessageChannel', StandardMessageCodec());
  String _batteryLevel = 'Unknown battery level.';
  var _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            child: Text('发送数据到原生'),
            onPressed: () async {
              var result =
                  await channel.send({'name': '望京钢铁侠', 'age': 18}) as Map;
              var name = result['name'];
              var age = result['age'];
              setState(() {
                _data = '$name,$age';
              });
            },
          ),
          Text('原生返回数据：$_data'),
        ],
      ),
    );
  }
}
