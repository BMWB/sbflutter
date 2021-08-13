/*
 * @Author: your name
 * @Date: 2021-07-27 19:53:43
 * @LastEditTime: 2021-07-27 20:36:51
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/sliver/sliverToBoxAdapter.dart
 */

import 'package:flutter/material.dart';

class sliverToBoxadapterSS extends StatefulWidget {
  sliverToBoxadapterSS({Key? key}) : super(key: key);

  static String routeName = '/lib/sliver/sliverToBoxAdapter.dart';

  @override
  _sliverToBoxadapterSSState createState() => _sliverToBoxadapterSSState();
}

class _sliverToBoxadapterSSState extends State<sliverToBoxadapterSS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.black,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return Container(
                height: 65,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 50),
          )
        ],
      ),
    );
  }
}
