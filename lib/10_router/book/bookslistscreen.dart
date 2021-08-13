/*
 * @Author: your name
 * @Date: 2021-07-29 10:40:12
 * @LastEditTime: 2021-07-29 11:01:01
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/router/book/bookslistscreen.dart
 */

import 'package:flutter/material.dart';
import 'book.dart';

class BooksListScreen extends StatelessWidget {
  final List<Book>? books;
  final ValueChanged<Book>? onTapped;

  BooksListScreen({
    @required this.books,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一页"),
      ),
      body: ListView(
        children: [
          for (var book in books!)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped!(book),
            )
        ],
      ),
    );
  }
}
