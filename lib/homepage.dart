import 'package:flutter/material.dart';

import 'demos.dart';
import 'package:sbflutter/10_sb_pages/data/sb.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  static String routeName = '/lib/navigator/homepage.dart';

  final String title;

  @override
  _MyHomePageState createState() {
    print('-----------------------> createState');
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('-----------------------> build');

    final headerStyle = Theme.of(context).textTheme.headline6;

    return ListView(
      children: [
        ListTile(
            hoverColor: Colors.grey,
            title: Text("05_eventbus", style: headerStyle)),
        ...eventbus.map((e) => DemoTile(demo: e)),
        ListTile(
            hoverColor: Colors.grey,
            title: Text("06_scrollview", style: headerStyle)),
        ...scrolls.map((e) => DemoTile(demo: e)),
        ListTile(
            hoverColor: Colors.grey,
            title: Text("07_sliver", style: headerStyle)),
        ...slivers.map((e) => DemoTile(demo: e)),
        ListTile(
            hoverColor: Colors.grey,
            title: Text("08_functional", style: headerStyle)),
        ...functions.map((e) => DemoTile(demo: e)),
        // ListTile(title: Text("09_scaffold", style: headerStyle)),
        ListTile(
            hoverColor: Colors.grey,
            title: Text("10_navigator", style: headerStyle)),
        ...navigators.map((e) => DemoTile(demo: e)),
        ListTile(
            hoverColor: Colors.grey,
            title: Text("11_animate", style: headerStyle)),
        ...animates.map((e) => DemoTile(demo: e)),
        ListTile(
            hoverColor: Colors.grey,
            title: Text("13_channel", style: headerStyle)),
        ...channels.map((e) => DemoTile(demo: e)),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addObserver(this);
    // print('-----------------------> 初始化 initState');

    // WidgetsBinding.instance!.addPostFrameCallback((_) =>
    //     {print("----------------------->单次Frame绘制回调(addPostFrameCallback)")});

    // WidgetsBinding.instance!.addPersistentFrameCallback((_) {
    //   print("----------------------->实时Frame绘制回调(addPostFrameCallback)");
    //   });
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print('----------------------->组件更新 didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    // print('重新安装 reassemble');
  }

  @override
  void deactivate() {
    super.deactivate();
    // print('停用  deactivate');
    // print('----------------------->停用  deactivate');
  }

  @override
  void setState(fn) {
    super.setState(fn);
    // print('状态刷新 setState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print('----------------------->依赖改变 didChangeDependencies');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this); //销毁观察者
    // print('----------------------->销毁 dispose');
  }

  ///当前系统改变了一些访问性活动的回调
  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
    // print("@@@@@@@@@ didChangeAccessibilityFeatures");
  }

  /// Called when the system is running low on memory.
  ///低内存回调
  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    // print("@@@@@@@@@ didHaveMemoryPressure");
  }

  /// Called when the system tells the app that the user's locale has
  /// changed. For example, if the user changes the system language
  /// settings.
  ///用户本地设置变化时调用，如系统语言改变
  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    // print("@@@@@@@@@ didChangeLocales");
  }

  /// Called when the application's dimensions change. For example,
  /// when a phone is rotated.
  ///应用尺寸改变时回调，例如旋转
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    Size size = WidgetsBinding.instance!.window.physicalSize;
    // print("@@@@@@@@@ didChangeMetrics  ：宽：${size.width} 高：${size.height}");
  }

  /// {@macro on_platform_brightness_change}
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    // print("@@@@@@@@@ didChangePlatformBrightness");
  }

  ///文字系数变化
  @override
  void didChangeTextScaleFactor() {
    super.didChangeTextScaleFactor();
    // print(
    // "@@@@@@@@@ didChangeTextScaleFactor  ：${WidgetsBinding.instance!.window.textScaleFactor}");
  }

  // AppLifecycleState 就是 App 的生命周期

  ///生命周期变化时回调
//  resumed:应用可见并可响应用户操作
//  inactive:用户可见，但不可响应用户操作
//  paused:已经暂停了，用户不可见、不可操作
//  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // print("@@@@@@@@@  生命周期变化时回调 @@@@@@@@@: $state");
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  const DemoTile({required this.demo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);

        // Navigator.push(
        //     context, MaterialPageRoute(builder: allRoutes[demo.route]!));
        // Navigator.pushNamed(context, '/lib/sliver/sliverAppBar.dart');
      },
    );
  }
}
