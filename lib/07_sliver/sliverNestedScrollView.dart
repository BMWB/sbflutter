/*
 * @Author: your name
 * @Date: 2021-07-27 21:14:35
 * @LastEditTime: 2021-07-27 21:22:07
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/sliver/sliverNestedScrollView.dart
 */

import 'package:flutter/material.dart';

class sliverNestedScrollView extends StatefulWidget {
  sliverNestedScrollView({Key? key}) : super(key: key);

  static String routeName = '/lib/sliver/sliverNestedScrollView.dart';

  @override
  _sliverNestedScrollViewState createState() => _sliverNestedScrollViewState();
}

class _sliverNestedScrollViewState extends State<sliverNestedScrollView> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 230.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('复仇者联盟'),
              background: Image.network(
                'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ];
      },
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
