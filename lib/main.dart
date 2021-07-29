/*
 * @Author: wangtianji
 * @Date: 2021-06-23 15:50:18
 * @LastEditTime: 2021-07-29 17:33:37
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/main.dart
 */
import 'package:flutter/material.dart';
import '09_scaffold/scaffold.dart';
import 'package:sbflutter/homepage.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: allRoutes,
      // initialRoute: '/lib/navigator/abcde/PageA.dart',
      home: HoneScreen(), //    /

      // onGenerateRoute: (settings) {
      //   // Handle '/'
      //   if (settings.name == '/') {
      //     return MaterialPageRoute(builder: (context) => HoneScreen());
      //   }

      //   // Handle '/details/:id'
      //   var uri = Uri.parse(settings.name!);
      //   // if (uri.pathSegments.length == 2 &&
      //   //     uri.pathSegments.first == 'details') {
      //   //   var id = uri.pathSegments[1];
      //   //   return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
      //   // }

      //   return MaterialPageRoute(builder: (context) => UnknownScreen());
      // },
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

//