/*
 * @Author: your name
 * @Date: 2021-07-27 18:30:32
 * @LastEditTime: 2021-07-27 19:44:50
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/sliver/sliverPersistentHeader.dart
 */

import 'package:flutter/material.dart';

class sliverpersistentHeaderSS extends StatefulWidget {
  sliverpersistentHeaderSS({Key? key}) : super(key: key);

  static String routeName = '/lib/sliver/sliverPersistentHeader.dart';

  @override
  _sliverpersistentHeaderSSState createState() =>
      _sliverpersistentHeaderSSState();
}

class _sliverpersistentHeaderSSState extends State<sliverpersistentHeaderSS> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: MySliverPersistentHeaderDelegate(),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 20),
        )
      ],
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text('我是一个SliverPersistentHeader',
            style: TextStyle(color: Colors.white)));
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 如果内容需要更新，设置为true
}
