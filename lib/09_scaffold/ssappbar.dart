/*
 * @Author: your name
 * @Date: 2021-07-28 16:46:11
 * @LastEditTime: 2021-07-28 20:40:30
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/scaffold/ssappbar.dart
 * ---------------appBar-----------------
leading	可以定制左上角按钮
automaticallyImplyLeading	是否自动导入左上角按钮，默认为 true，例如默认导入返回按钮
title	AppBar 标题
actions	右上角功能按钮，可自定义
flexibleSpace	可折叠的应用栏，在改变 appBar 的 size 时有效果
bottom	AppBar下方悬浮栏，可以看下文图片
elevation	阴影高度，默认为4.0
shadowColor	阴影颜色
shape	阴影 ShapeBorder
backgroundColor	AppBar 背景色
brightness	Brightness.dark 和 Brightness.light，改变上方电池，时间等状态栏颜色
iconTheme	所有 icon 的主题
actionsIconTheme	actions 里的所有 icon 主题
textTheme	text 主题
primary	AppBar 是否在整个屏幕最上方，为 true 时，距离 AppBar 贴合状态栏下方，false 时，贴合整个屏幕最上方
centerTitle	title 是否居中
excludeHeaderSemantics	Whether the title should be wrapped with header [Semantics]. 默认为false，没太大用
titleSpacing	title 距离左侧偏移量
toolbarOpacity	AppBar 透明度
bottomOpacity	bottom 透明度
toolbarHeight	AppBar 高度
 */

import 'package:flutter/material.dart';

class ssappbar extends AppBar {
  ssappbar({Key? key})
      : super(
          key: key,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.menu_book));
          }),
          title: Text("望京钢铁侠"),
          // toolbarHeight: 500,
          // flexibleSpace: _flexibleSpaceBar(),
          // toolbarOpacity: 0.5,
          brightness: Brightness.light,
          titleSpacing: 4,
          centerTitle: true,
          actions: <Widget>[
            // IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            // IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            Container(
              width: 50,
              color: Colors.green,
              child: Icon(Icons.image),
            ),
            Container(
              width: 50,
              color: Colors.greenAccent,
              child: Icon(Icons.accessible),
            ),
            // Container(
            //   width: 50,
            //   color: Colors.grey,
            //   child: Icon(Icons.backspace),
            // ),
            // Container(
            //   width: 70,
            //   color: Colors.yellowAccent,
            //   child: Icon(Icons.battery_unknown),
            // ),
            // Container(
            //   width: 50,
            //   color: Colors.grey,
            //   child: Icon(Icons.backspace),
            // ),
            // Container(
            //   width: 50,
            //   color: Colors.yellowAccent,
            //   child: Icon(Icons.battery_unknown),
            // ),
          ],
        );
}

FlexibleSpaceBar _flexibleSpaceBar() {
  return FlexibleSpaceBar(
    title: Text('FlexibleSpaceBar'),
  );
}
