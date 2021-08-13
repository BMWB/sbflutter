/*
 * @Author: your name
 * @Date: 2021-07-27 18:17:15
 * @LastEditTime: 2021-07-27 18:18:39
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/sliver/sliverAppBar.dart
 */

import 'package:flutter/material.dart';

class SliverAppBarSS extends StatefulWidget {
  SliverAppBarSS({Key? key}) : super(key: key);

  static String routeName = '/lib/sliver/sliverAppBar.dart';

  @override
  _SliverAppBarSSState createState() => _SliverAppBarSSState();
}

class _SliverAppBarSSState extends State<SliverAppBarSS> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('复仇者联盟'),
            background: Image.network(
              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 80.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[(index % 18)],
                  child: Text(''),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
