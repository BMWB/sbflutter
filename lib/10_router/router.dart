/*
 * @Author: your name
 * @Date: 2021-07-29 11:06:53
 * @LastEditTime: 2021-07-31 09:40:10
 * @LastEditors: wangtianji
 * @Description: In User Settings Edit
 * @FilePath: /sbflutter/lib/10_router/router.dart
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'book/book.dart';
import 'book/bookdetailsscreen.dart';
import 'book/bookslistscreen.dart';
import 'book/bookdetailspage.dart';
import 'book/bookroutepath.dart';
import '../11_animate/ext.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser =
      BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) {
    final uri = Uri.parse(routeInformation.location!);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return SynchronousFuture(BookRoutePath.home());
    }

    // Handle '/book/:id'
    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'book') {
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id != null) {
        return SynchronousFuture(BookRoutePath.details(id));
      }
    }

    // Handle unknown routes
    return SynchronousFuture(BookRoutePath.unknown());
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    return null;
  }
}

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Book? _selectedBook;
  bool show404 = false;

  final List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }
    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook!));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('BooksListPage'),
          child: BooksListScreen(
            books: books,
            onTapped: _handleBookTapped,
          ),
        ),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_selectedBook != null)
          BookDetailsPage(book: _selectedBook!)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404 = false;
        notifyListeners(); //使用 notifyListeners 代替 setState 因为此类现在是 ChangeNotifier 而不是小部件。

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) {
    if (path.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return SynchronousFuture<void>(null);
    }

    if (path.isDetailsPage) {
      if (path.id! < 0 || path.id! > books.length - 1) {
        show404 = true;
        return SynchronousFuture<void>(null);
      }

      _selectedBook = books[path.id!];
    } else {
      _selectedBook = null;
    }

    show404 = false;
    return SynchronousFuture<void>(null);
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners(); //使用 notifyListeners 代替 setState 因为此类现在是 ChangeNotifier 而不是小部件。
  }
}
