/*
 * @Author: wangtianji
 * @Date: 2021-07-31 14:46:48
 * @LastEditTime: 2021-07-31 14:46:48
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/09_scaffold/sbobserver.dart
 */

import 'package:flutter/material.dart';

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
