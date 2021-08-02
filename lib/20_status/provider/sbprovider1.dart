/*
 * @Author: wangtianji
 * @Date: 2021-07-31 15:11:45
 * @LastEditTime: 2021-07-31 16:01:59
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/provider/sbprovider.dart
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green[200],
              child: RaisedButton(
                child: Text('Do something'),
                onPressed: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(35),
              color: Colors.blue[200],
              child: Text('Show something'),
            ),
          ],
        ),
      ),
    );
  }
}
