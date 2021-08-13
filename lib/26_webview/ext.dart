/*
 * @Author: wangtianji
 * @Date: 2021-08-13 11:01:56
 * @LastEditTime: 2021-08-13 11:01:56
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/26_webview/ext.dart
 */

import '../demos.dart';
import 'sbwebview.dart';

final webviews = [
  Demo(
      name: "sbwebview",
      route: WebViewExample.routeName,
      builder: (context) => WebViewExample()),
];
