/*
 * @Author: your name
 * @Date: 2021-07-17 10:46:35
 * @LastEditTime: 2021-07-30 14:15:28
 * @LastEditors: wangtianji
 * @Description: In User Settings Edit
 * @FilePath: /sbflutter/lib/10_router/pages.dart
 */

library nav2_pages;

import 'package:flutter/material.dart';
import 'package:sbflutter/11_animate/animated_controller.dart';
import 'book/book.dart';
import 'book/bookdetailsscreen.dart';
import 'book/bookslistscreen.dart';
import 'book/bookdetailspage.dart';
import '../11_animate/ext.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  final List<Book> _bookPages = [];

  final List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: BooksListScreen(
              books: books,
              onTapped: _handleBookTapped,
            ),
          ),
          ..._bookPages.map((e) => BookDetailsPage(book: e)),
          // ...animatespages
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _bookPages.clear();
          });

          return true;
        },
      ),
    );
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _bookPages.add(book);
    });
  }
}
