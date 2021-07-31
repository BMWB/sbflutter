/*
 * @Author: wangtianji
 * @Date: 2021-06-23 15:50:18
 * @LastEditTime: 2021-07-31 14:43:52
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/main.dart
 */
import 'package:flutter/material.dart';
import '09_scaffold/scaffold.dart';
import 'package:sbflutter/10_sb_pages/data/sb.dart';

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
class MyObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    //可通过route.settings获取路由相关内容
    //route.currentResult获取返回内容
    //....等等

    var ss = route.settings.name;
    print("didPush$ss");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    var ss = route.settings.name;
    print("didPop$ss");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    var ss = route.settings.name;
    print("didRemove$ss");
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    var ss = newRoute!.settings.name;
    var oo = oldRoute!.settings.name;
    print("didReplace$ss  --- $oo");
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    var ss = route.settings.name;
    print("didStartUserGesture$ss");
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    print("didStopUserGesture");
  }
}
