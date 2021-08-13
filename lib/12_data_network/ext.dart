/*
 * @Author: wangtianji
 * @Date: 2021-08-11 10:33:53
 * @LastEditTime: 2021-08-11 14:38:45
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/12_data_network/ext.dart
 */

import 'sb_path_provider.dart';
import 'sb_sqlite.dart';

import '../demos.dart';

final datas = [
  Demo(
      name: "PathProviderDemo",
      route: PathProviderDemo.routeName,
      builder: (context) => PathProviderDemo()),
  Demo(
      name: "sb_sqlite",
      route: AddUser.routeName,
      builder: (context) => AddUser()),
];
