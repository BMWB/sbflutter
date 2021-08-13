/*
 * @Author: your name
 * @Date: 2021-07-17 10:17:06
 * @LastEditTime: 2021-07-28 21:10:29
 * @LastEditors: Please set LastEditors
 * @Description: scaffold
 * @FilePath: /ssflutter/lib/navigator/Material.dart
 * appBar	页面上方导航条
 
 --------------Scaffold
body	页面容器
floatingActionButton	悬浮按钮
floatingActionButtonLocation	悬浮按钮位置
floatingActionButtonAnimator	悬浮按钮动画
persistentFooterButtons	显示在底部导航条上方的一组按钮
drawer	左侧菜单
endDrawer	右侧菜单
bottomNavigationBar	底部导航条
bottomSheet	一个持久停留在body下方，底部控件上方的控件
backgroundColor	背景色
resizeToAvoidBottomPadding	已废弃，resizeToAvoidBottomInset作为替代
resizeToAvoidBottomInset	默认为 true，防止一些小组件重复
primary	是否在屏幕顶部显示Appbar, 默认为 true，Appbar 是否向上延伸到状态栏，如电池电量，时间那一栏
drawerDragStartBehavior	控制 drawer 的一些特性
extendBody	body 是否延伸到底部控件
extendBodyBehindAppBar	默认 false，为 true 时，body 会置顶到 appbar 后，如appbar 为半透明色，可以有毛玻璃效果
drawerScrimColor	侧滑栏拉出来时，用来遮盖主页面的颜色
drawerEdgeDragWidth	侧滑栏拉出来的宽度
drawerEnableOpenDragGesture	左侧侧滑栏是否可以滑动
endDrawerEnableOpenDragGesture	右侧侧滑栏是否可以滑动
*/

library scaffold;

import 'package:flutter/material.dart';
import 'package:sbflutter/homepage.dart';
import 'ssbottomnavigationbar.dart';
import 'ssdrawer.dart';
import 'ssappbar.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("MyPage"),
      ),
    );
  }
}

class HoneScreen extends StatefulWidget {
  HoneScreen({Key? key}) : super(key: key);

  @override
  _HoneScreenState createState() => _HoneScreenState();
}

class _HoneScreenState extends State<HoneScreen>
    with SingleTickerProviderStateMixin {
  get ture => null;

  int _currentIndex = 0;

  Widget _currBody = MyHomePage(
    title: '',
  );

  AppBar _currappBar = ssappbar();
  // late TabController _tabController;

  late TabController _tabController;

  //销毁时调用
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  //初始化调用
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      //点击tab回调一次，滑动切换tab不会回调
      if (_tabController.indexIsChanging) {
        print("ysl--${_tabController.index}");
      }

      //点击tab时或滑动tab回调一次
      if (_tabController.index.toDouble() == _tabController.animation!.value) {
        print("ysl${_tabController.index}");
      }
    });
  }

  _onTap(int index) {
    switch (index) {
      case 0:
        _currappBar = ssappbar();
        _currBody = MyHomePage(
          title: '',
        );
        break;
      case 1:
        _currappBar = AppBar(
          //必须配置
          title: Text("TabController学习"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: "页面A",
              ),
              Tab(
                text: "页面B",
              ),
              Tab(
                text: "页面C",
              )
            ],
          ),
        );
        _currBody = TabBarView(
          //必须配置
          controller: _tabController,
          children: [
            Center(child: Text("页面A")),
            Center(child: Text("页面B")),
            Center(child: Text("页面C"))
          ],
        );

        break;
      case 2:
        _currappBar = ssappbar();
        _currBody = MyPage();
        break;
    }
    setState(() {
      print(index);
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _currappBar,
        body: _currBody,
        // _currBody（）, //WillPopScope(child: _currBody, onWillPop: () async => showDialog(context: context, builder: (context) => AlertDialog(title: Text("你确定要退出"),))),
        drawer: Drawer(
          child: RaisedButton(
              child: Text("zuo边抽屉"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        endDrawer: ssdrawer(),
        drawerScrimColor: Theme.of(context).primaryColor,
        // drawerEdgeDragWidth: 200,
        // bottomSheet: _bottomSheet(),
        // drawerEnableOpenDragGesture: false,
        bottomNavigationBar:
            ssbottomnavigtionbar(_currentIndex, context, _onTap),

        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar(); //删除旧的消息

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.black,
                elevation: 8,
                behavior: SnackBarBehavior.fixed,
                duration: Duration(seconds: 100), //默认是4秒
                action: SnackBarAction(
                  label: "确定",
                  onPressed: () {
                    print("确定");
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  },
                ),
                // shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(100)),
                // content: Text('望京钢铁侠 出现了'),
                content: Container(
                  height: 400,
                  child: Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      Text("下载成功")
                    ],
                  ),
                ),
              ));
            },
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // persistentFooterButtons: _persistentFooterButtons()
      ),
    );
  }
}

List<Widget> _persistentFooterButtons() {
  return [
    Container(
      width: 100,
      height: 100,
      color: Colors.red,
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.green,
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.cyan,
    ),
  ];
}

BottomSheet _bottomSheet() {
  return BottomSheet(
    onClosing: () {},
    builder: (BuildContext context) {
      return Container(
        height: 60,
        color: Colors.cyan,
        child: Text('Bottom Sheet'),
        alignment: Alignment.center,
      );
    },
  );
}

class DoubleClickBack extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DoubleClickBackState();
  }
}

class DoubleClickBackState extends State<DoubleClickBack> {
  late DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          // if (_lastPressedAt == null ||
          //     DateTime.now().difference(_lastPressedAt) >
          //         Duration(seconds: 1)) {
          //   //两次点击间隔超过1秒则重新计时
          //   _lastPressedAt = DateTime.now();
          //   ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          //     duration: new Duration(seconds: 1),
          //     content: new Text("再次点击,退出程序"),
          //     backgroundColor: Colors.blue,
          //   ));
          //   return false;
          // }

          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            duration: new Duration(seconds: 1),
            content: new Text("再次点击,退出程序"),
            backgroundColor: Colors.blue,
          ));
          return false;
        },
        child: Container(
          alignment: Alignment.center,
          child: Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(); //隐藏侧边栏
              },
            ),
          ),
        ));
  }
}
