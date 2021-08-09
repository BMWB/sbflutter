/*
 * @Author: wangtianji
 * @Date: 2021-08-09 10:33:35
 * @LastEditTime: 2021-08-09 10:39:33
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/11_animate/animated_page_route.dart
 */

import 'package:flutter/material.dart';

class PageRouteBuilderDemo extends StatelessWidget {
  const PageRouteBuilderDemo({Key? key}) : super(key: key);

  static const String routeName = '/lib/11_animate/animated_page_route.dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push<void>(_createRoute());
              },
              child: Text("Go!"))),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => _Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween =
          Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
      var curveTween = CurveTween(curve: Curves.ease);

      return SlideTransition(
        position: animation.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Text('Page 2!', style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
