/*
 * @Author: wangtianji
 * @Date: 2021-06-23 15:50:18
 * @LastEditTime: 2021-08-13 11:05:22
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/main.dart
 */
import 'package:flutter/material.dart';
import '09_scaffold/scaffold.dart';
import 'package:sbflutter/10_sb_pages/data/sb.dart';
import 'package:sbflutter/09_scaffold/sbobserver.dart';

import '10_sb_pages/sb_delegate.dart';
import '10_sb_pages/sb_information_parser.dart';

// main(List<String> args) {
//   runApp(sbApp());
// }

// class sbApp extends StatefulWidget {
//   sbApp({Key? key}) : super(key: key);

//   @override
//   _sbAppState createState() => _sbAppState();
// }

// class _sbAppState extends State<sbApp> {
//   SBRouterDelegate _routerDelegate = SBRouterDelegate();
//   SBRouteInformationParser _routeInformationParser = SBRouteInformationParser();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//         title: 'sb App',
//         routeInformationParser: _routeInformationParser,
//         routerDelegate: _routerDelegate);
//   }
// }

void main() {
  print('这是个main');
  runApp(AnimationSamples());
}

class AnimationSamples extends StatelessWidget {
  const AnimationSamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation Samples",
      routes: allRoutes,
      // initialRoute: '/lib/navigator/abcde/PageA.dart',
      home: HoneScreen(), //    /
      navigatorObservers: [MyObserver()],
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => HoneScreen());
        }

        // Handle '/details/:id'
        var uri = Uri.parse(settings.name!);
        // if (uri.pathSegments.length == 2 &&
        //     uri.pathSegments.first == 'details') {
        //   var id = uri.pathSegments[1];
        //   return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
        // }

        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue.shade50, //主题色
        cardColor: Colors.blue.shade100, //主题色
        shadowColor: Colors.blue.shade200, //主题色
        splashColor: Colors.blue.shade300, //主题色
        selectedRowColor: Colors.blue.shade900, //主题色
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red, //主题色
        accentColor: Colors.red.shade50, //主题色
        cardColor: Colors.red.shade100, //主题色
        shadowColor: Colors.red.shade200, //主题色
        splashColor: Colors.red.shade300, //主题色
        selectedRowColor: Colors.red.shade900, //主题色
      ),

      themeMode: ThemeMode.system,
    );
  }
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

//路由观察器，当调用Navigator的相关方法时，会回调相关的操作