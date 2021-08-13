/*
 * @Author: your name
 * @Date: 2021-07-27 16:35:45
 * @LastEditTime: 2021-07-27 16:40:16
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/sliver/sliverList.dart
 */
import 'package:flutter/material.dart';

class SliverListSS extends StatefulWidget {
  const SliverListSS({Key? key}) : super(key: key);

  static String routeName = '/lib/sliver/sliverList.dart';

  @override
  _SliverListSSState createState() => _SliverListSSState();
}

class _SliverListSSState extends State<SliverListSS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliver List')),
      body: CustomScrollView(slivers: [
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            height: 44,
            color: Colors.primaries[(index % 18)],
          );
        }, childCount: 10)),
        SliverGrid(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Colors.primaries[(index % 18)],
              );
            }, childCount: 21),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5))
      ]),
    );
  }
}
