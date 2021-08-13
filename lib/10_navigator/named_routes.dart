/*
 * @Author: your name
 * @Date: 2021-07-17 10:28:07
 * @LastEditTime: 2021-07-27 16:35:27
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/navigator/named_routes.dart
 * navigatorKey（导航键）	GlobalKey<NavigatorState>
home（主页）	Widget
routes（路由）	Map<String, WidgetBuilder>
initialRoute（初始路由）	String
onGenerateRoute（生成路由）	RouteFactory
onUnknownRoute（未知路由）	RouteFactory
navigatorObservers（导航观察器）	List<NavigatorObserver>
builder（建造者）	TransitionBuilder
title（标题）	String
onGenerateTitle（生成标题）	GenerateAppTitle
color（颜色）	Color
theme（主题）	ThemeData
locale(地点)	Locale
localizationsDelegates（本地化委托）	Iterable<LocalizationsDelegate<dynamic>>
localeResolutionCallback（区域分辨回调）	LocaleResolutionCallback
supportedLocales（支持区域）	Iterable<Locale>
debugShowMaterialGrid（调试显示材质网格）	bool
showPerformanceOverlay（显示性能叠加）	bool
checkerboardRasterCacheImages（棋盘格光栅缓存图像）	bool
checkerboardOffscreenLayers（棋盘格层）	bool
showSemanticsDebugger（显示语义调试器）	bool
debugShowCheckedModeBanner（调试显示检查模式横幅）	bool

 */
library named_routes;

import 'package:flutter/material.dart';

void main() {
  runApp(Nav2App());
}

class Nav2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// 声明程序中有哪个通过Navigation.of(context).pushNamed跳转的路由
// 参数以键值对的形式传递
// key:路由名字
// value:对应的Widget
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailScreen(),
      },
//应用程序的主题，各种的定制颜色都可以设置，用于程序主题切换
      theme: ThemeData(primarySwatch: Colors.amber),
      color: Colors.red.shade600, //该颜色为Android中程序切换中应用图标背景的颜色，当应用图标背景为透明时
// 初始路由，当用户进入程序时，自动打开对应的路由。
// (home还是位于一级)
// 传入的是上面routes的key
// 跳转的是对应的Widget（如果该Widget有Scaffold.AppBar,并不做任何修改，左上角有返回键）
      initialRoute: '/details',
//该标题出现在
// Android：任务管理器的程序快照之上
// IOS: 程序切换管理器中
      title: "Demo",
// 跟上面的tiitle一样，但含有一个context参数
// 用于做本地化
      onGenerateTitle: (context) {
        return "Flutter Demo";
      },
// 路由观察器，当调用Navigator的相关方法时，会回调相关的操作
      navigatorObservers: [MyObserver()],

// 当前区域，如果为null则使用系统区域
// 一般用于语言切换
      locale: Locale("yy", "zh"),
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: TextButton(
          child: Text('View Details'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details',
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
