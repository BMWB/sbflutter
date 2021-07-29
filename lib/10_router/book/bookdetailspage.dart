/*
 * @Author: your name
 * @Date: 2021-07-29 10:41:48
 * @LastEditTime: 2021-07-29 10:41:48
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/router/book/bookdetailspage.dart
 */

import 'package:flutter/material.dart';
import 'book.dart';
import 'bookdetailsscreen.dart';

class BookDetailsPage extends Page {
  final Book? book;

  BookDetailsPage({
    this.book,
  }) : super(key: ValueKey(book));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailsScreen(book: book);
      },
    );
  }
}
