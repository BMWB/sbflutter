/*
 * @Author: your name
 * @Date: 2021-07-28 17:10:31
 * @LastEditTime: 2021-07-28 20:57:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/scaffold/ssbottomnavigationbar.dart
 * BottomNavigationBar属性

unselectedLabelStyle	未选中 title 样式 TextStyle
unselectedItemColor	未选中 title 填充色
unselectedIconTheme	未选中 item 图标主题
unselectedFontSize	未选中 title 字体大小，默认12.0
type	BottomNavigationBarType，默认 fixed，设置为 shifting 时，建议设置选中样式，和为选中样式，提供一个特殊动画
showUnselectedLabels	是否展示未选中 title，默认为true
showSelectedLabels	是否展示选中 title，默认为true
selectedLabelStyle	选中 title 样式 TextStyle
selectedItemColor	选中 title 填充色
selectedIconTheme	选中 item 图标主题
selectedFontSize	选中 title 字体大小，默认14.0
onTap	点击事件
mouseCursor	鼠标悬停，Web 开发可以了解
items	必填项，设置各个按钮,
iconSize	图标大小，默认 24.0
fixedColor	选中 item 填充色
elevation	控制阴影高度，默认为 8.0
currentIndex	当前选中 item 下标
backgroundColor	整个 BottomNavigationBar 背景色
 */

import 'package:flutter/material.dart';

class ssbottomnavigtionbar extends BottomNavigationBar {
  final ValueChanged<int>? sonTap;

  ssbottomnavigtionbar(
    int _currentIndex,
    BuildContext context,
    this.sonTap,
  ) : super(
          onTap: sonTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.red,
          currentIndex: _currentIndex,
          // selectedIconTheme: IconThemeData(color: Colors.orange, size: 24),
          // unselectedIconTheme: IconThemeData(
          //   color: Colors.black,
          //   size: 60,
          // ),
          // selectedLabelStyle: TextStyle(color: Colors.yellow, fontSize: 50),
          // unselectedLabelStyle: TextStyle(
          //   color: Colors.cyan,
          // ),
          // showSelectedLabels: false,
          // showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(title: Text('书籍'), icon: Icon(Icons.book)),
            BottomNavigationBarItem(title: Text('聊天'), icon: Icon(Icons.chat)),
            BottomNavigationBarItem(
                title: Text('我的'), icon: Icon(Icons.perm_identity)),
          ],
        );
}
