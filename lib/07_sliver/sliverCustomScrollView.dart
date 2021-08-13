/*
 * @Author: your name
 * @Date: 2021-07-27 20:52:39
 * @LastEditTime: 2021-07-27 21:11:56
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/sliver/customScrollView.dart
 */

import 'package:flutter/material.dart';

class sliverCustomScrollView extends StatefulWidget {
  sliverCustomScrollView({Key? key}) : super(key: key);

  static String routeName = '/lib/sliver/sliverCustomScrollView.dart';

  @override
  _sliverCustomScrollViewState createState() => _sliverCustomScrollViewState();
}

class _sliverCustomScrollViewState extends State<sliverCustomScrollView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // scrollDirection: Axis.horizontal,
      // reverse: true,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 230.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('复仇者联盟'),
            background: Image.network(
              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 4,
          children: List.generate(8, (index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }).toList(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              height: 85,
              alignment: Alignment.center,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                '$index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }, childCount: 25),
        )
      ],
    );
  }
}
