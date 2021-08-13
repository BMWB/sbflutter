/*
 * @Author: your name
 * @Date: 2021-07-29 11:23:06
 * @LastEditTime: 2021-07-29 11:23:06
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/router/book/bookroutepath.dart
 */
import 'package:flutter/material.dart';

//RouteInformationParser 将路由信息解析为用户定义的数据类型，因此我们首先定义该类型：
class BookRoutePath {
  final int? id;
  final bool isUnknown;

  BookRoutePath.home()
      : id = null,
        isUnknown = false;

  BookRoutePath.details(this.id) : isUnknown = false;

  BookRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}
