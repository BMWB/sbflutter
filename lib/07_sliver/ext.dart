/*
 * @Author: your name
 * @Date: 2021-07-28 11:10:19
 * @LastEditTime: 2021-07-29 15:43:01
 * @LastEditors: wangtianji
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/07_sliver/ext.dart
 */

import 'sliverList.dart';
import 'sliverAppBar.dart';
import 'sliverPersistentHeader.dart';
import 'sliverToBoxAdapter.dart';
import 'sliverCustomScrollView.dart';
import 'sliverNestedScrollView.dart';

import '../demos.dart';

final slivers = [
  Demo(
      name: "sliverList",
      route: SliverListSS.routeName,
      builder: (context) => SliverListSS()),
  Demo(
      name: "sliverAppBar",
      route: SliverAppBarSS.routeName,
      builder: (context) => SliverAppBarSS()),
  Demo(
      name: "sliverPersistentHeader",
      route: sliverpersistentHeaderSS.routeName,
      builder: (context) => sliverpersistentHeaderSS()),
  Demo(
      name: "sliverToBoxAdapter",
      route: sliverToBoxadapterSS.routeName,
      builder: (context) => sliverToBoxadapterSS()),
  Demo(
      name: "sliverCustomScrollView",
      route: sliverCustomScrollView.routeName,
      builder: (context) => sliverCustomScrollView()),
  Demo(
      name: "sliverNestedScrollView",
      route: sliverNestedScrollView.routeName,
      builder: (context) => sliverNestedScrollView()),
];
