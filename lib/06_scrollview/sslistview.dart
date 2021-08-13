/*
 * @Author: your name
 * @Date: 2021-07-27 21:25:30
 * @LastEditTime: 2021-07-27 21:32:48
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/scrollview/sslistview.dart
 */
import 'package:flutter/material.dart';

class sslistview extends StatefulWidget {
  sslistview({Key? key}) : super(key: key);

  static String routeName = '/lib/scrollview/sslistview.dart';

  @override
  _sslistviewState createState() => _sslistviewState();
}

class _sslistviewState extends State<sslistview> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        print('${_controller.position}');
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: Text('滚动到指定位置'),
              onPressed: () {
                _controller.animateTo(200,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              reverse: false,
              itemBuilder: (BuildContext context, int index) {
                return _ListItem(
                  title: '$index',
                );
              },
              itemCount: 30,
              itemExtent: 50,
            ),
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;

  const _ListItem({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        child: Text('$title'),
      ),
    );
  }
}
