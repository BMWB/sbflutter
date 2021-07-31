/*
 * @Author: wangtianji
 * @Date: 2021-07-31 10:06:41
 * @LastEditTime: 2021-07-31 14:14:10
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/10_sb_pages/sb_delegate.dart
 */

import 'package:flutter/material.dart';
import 'package:sbflutter/10_sb_pages/sb_route_path.dart';
import 'package:sbflutter/09_scaffold/scaffold.dart';
import 'data/sb.dart';
import 'sb_page.dart';

class SBRouterDelegate extends RouterDelegate<SBRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<SBRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  SBRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  final List<sb> _bookPages = [];
  // sb? _selectedsb;
  bool show404 = false;

  SBRoutePath get currentConfiguration {
    print("currentConfiguration");
    if (show404) {
      return SBRoutePath.unknown();
    }
    return _bookPages.isEmpty
        ? SBRoutePath.home()
        : SBRoutePath.details(_bookPages.last.route);
  }

  @override
  Widget build(BuildContext context) {
    List<Page> pages = <Page>[
      MaterialPage(
        key: ValueKey('/'),
        child: HoneScreen(),
      ),
      if (show404)
        MaterialPage(key: ValueKey('/404'), child: UnknownScreen())
      else if (_bookPages.isNotEmpty)
        ..._bookPages.map((e) => SBPage(ss: e))
    ];

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _bookPages.removeLast();
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(SBRoutePath path) async {
    print("setNewRoutePath");
    if (path.isUnknown) {
      _bookPages.clear();
      show404 = true;
      return;
    }

    if (path.isDetailsPage) {
      if (path.route == null) {
        show404 = true;
        return;
      }
      _bookPages.add(sb(path.route!));
    } else {
      _bookPages.clear();
    }

    show404 = false;
  }

  // void _handleVeggieTapped(sb veggie) {
  //   print("_handleVeggieTapped");
  //   _selectedsb = veggie;
  //   notifyListeners();
  // }
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
