/*
 * @Author: your name
 * @Date: 2021-07-29 14:13:57
 * @LastEditTime: 2021-07-29 14:13:57
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/router/book/booksappstate.dart
 */

import 'package:flutter/material.dart';
import 'book.dart';

class BooksAppState extends ChangeNotifier {
  int _selectedIndex;

  Book? _selectedBook;

  final List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  BooksAppState() : _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int idx) {
    _selectedIndex = idx;
    if (_selectedIndex == 1) {
      // Remove this line if you want to keep the selected book when navigating
      // between "settings" and "home" which book was selected when Settings is
      // tapped.
      selectedBook = null;
    }
    notifyListeners();
  }

  Book? get selectedBook => _selectedBook;

  set selectedBook(Book? book) {
    _selectedBook = book;
    notifyListeners();
  }

  int getSelectedBookById() {
    if (!books.contains(_selectedBook)) return 0;
    return books.indexOf(_selectedBook!);
  }

  void setSelectedBookById(int id) {
    if (id < 0 || id > books.length - 1) {
      return;
    }

    _selectedBook = books[id];
    notifyListeners();
  }
}
