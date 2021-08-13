/*
 * @Author: your name
 * @Date: 2021-07-29 10:30:33
 * @LastEditTime: 2021-07-29 10:47:00
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/router/page.dart
 */

import 'package:flutter/material.dart';
import 'book/book.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: Scaffold(
              appBar: AppBar(
                title: Text("page"),
              ),
              body: Center(
                child: Text("page"),
              ),
            ),
          )
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
