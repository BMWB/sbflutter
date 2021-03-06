/*
 * @Author: your name
 * @Date: 2021-07-29 10:38:40
 * @LastEditTime: 2021-07-29 10:38:40
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/router/book/bookdetailsscreen.dart
 */

import 'package:flutter/material.dart';
import 'book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book? book;

  BookDetailsScreen({
    @required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(book!.title, style: Theme.of(context).textTheme.headline6),
              Text(book!.author, style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        ),
      ),
    );
  }
}
