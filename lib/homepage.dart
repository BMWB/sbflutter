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
            title: Text("12_data_network", style: headerStyle)),
        ...datas.map((e) => DemoTile(demo: e)),
        ListTile(
            hoverColor: Colors.grey,
            title: Text("13_channel", style: headerStyle)),
        ...channels.map((e) => DemoTile(demo: e)),
        ListTile(
            hoverColor: Colors.grey,
            title: Text("26_webview", style: headerStyle)),
        ...webviews.map((e) => DemoTile(demo: e)),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addObserver(this);
    // print('-----------------------> ????????? initState');

    // WidgetsBinding.instance!.addPostFrameCallback((_) =>
    //     {print("----------------------->??????Frame????????????(addPostFrameCallback)")});

    // WidgetsBinding.instance!.addPersistentFrameCallback((_) {
    //   print("----------------------->??????Frame????????????(addPostFrameCallback)");
    //   });
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print('----------------------->???????????? didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    // print('???????????? reassemble');
  }

  @override
  void deactivate() {
    super.deactivate();
    // print('??????  deactivate');
    // print('----------------------->??????  deactivate');
  }

  @override
  void setState(fn) {
    super.setState(fn);
    // print('???????????? setState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print('----------------------->???????????? didChangeDependencies');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this); //???????????????
    // print('----------------------->?????? dispose');
  }

  ///???????????????????????????????????????????????????
  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
    // print("@@@@@@@@@ didChangeAccessibilityFeatures");
  }

  /// Called when the system is running low on memory.
  ///???????????????
  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    // print("@@@@@@@@@ didHaveMemoryPressure");
  }

  /// Called when the system tells the app that the user's locale has
  /// changed. For example, if the user changes the system language
  /// settings.
  ///?????????????????????????????????????????????????????????
  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    // print("@@@@@@@@@ didChangeLocales");
  }

  /// Called when the application's dimensions change. For example,
  /// when a phone is rotated.
  ///??????????????????????????????????????????
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    Size size = WidgetsBinding.instance!.window.physicalSize;
    // print("@@@@@@@@@ didChangeMetrics  ?????????${size.width} ??????${size.height}");
  }

  /// {@macro on_platform_brightness_change}
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    // print("@@@@@@@@@ didChangePlatformBrightness");
  }

  ///??????????????????
  @override
  void didChangeTextScaleFactor() {
    super.didChangeTextScaleFactor();
    // print(
    // "@@@@@@@@@ didChangeTextScaleFactor  ???${WidgetsBinding.instance!.window.textScaleFactor}");
  }

  // AppLifecycleState ?????? App ???????????????

  ///???????????????????????????
//  resumed:????????????????????????????????????
//  inactive:??????????????????????????????????????????
//  paused:????????????????????????????????????????????????
//  suspending??????????????????????????????IOS??????????????????
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // print("@@@@@@@@@  ??????????????????????????? @@@@@@@@@: $state");
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
