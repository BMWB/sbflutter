/*
 * @Author: your name
 * @Date: 2021-07-28 14:22:51
 * @LastEditTime: 2021-07-28 21:56:16
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/navigator/abcde/PageA.dart
 */
import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  PageA(String s, {Key? key}) : super(key: key);

  static String routeName = '/lib/navigator/abcde/PageA.dart';

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageA"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            child: RaisedButton(
              child: Text("向上个页面回传值"),
              onPressed: () {
                // Navigator.pop(context, ["来自PageA的回传参数"]); // 往回传一个数组
                Navigator.pop(context); // 往回传一个字符串
              },
            ),
          ),
          Container(
            child: RaisedButton(
                child: Text("PageB"),
                onPressed: () {
                  var result = Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return PageB("这是传递给PageB的参数"); // 通过构造方法传递参数
                  }));
                }),
          ),
        ],
      )),
    );
  }
}

class PageB extends StatefulWidget {
  PageB(String s, {Key? key}) : super(key: key);

  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageB"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            child: RaisedButton(
              child: Text("向上个页面回传值"),
              onPressed: () {
                Navigator.pop(context, ["来自PageB的回传参数"]); // 往回传一个数组
                // Navigator.pop(context,"来自PageA的回传参数");// 往回传一个字符串
              },
            ),
          ),
          Container(
            child: RaisedButton(
                child: Text("PageC"),
                onPressed: () {
                  var result = Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return PageC("这是传递给PageC的参数"); // 通过构造方法传递参数
                  }));
                }),
          ),
        ],
      )),
    );
  }
}

class PageC extends StatefulWidget {
  PageC(String s, {Key? key}) : super(key: key);

  @override
  _PageCState createState() => _PageCState();
}

class _PageCState extends State<PageC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageC"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            child: RaisedButton(
              child: Text("向上个页面回传值"),
              onPressed: () {
                Navigator.pop(context, ["来自PageC的回传参数"]); // 往回传一个数组
                // Navigator.pop(context,"来自PageA的回传参数");// 往回传一个字符串
              },
            ),
          ),
          Container(
            child: RaisedButton(
                child: Text("PageD"),
                onPressed: () {
                  var result = Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return PageD("这是传递给PageD的参数"); // 通过构造方法传递参数
                  }));
                }),
          ),
        ],
      )),
    );
  }
}

class PageD extends StatefulWidget {
  PageD(String s, {Key? key}) : super(key: key);

  @override
  _PageDState createState() => _PageDState();
}

class _PageDState extends State<PageD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageD"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            child: RaisedButton(
              child: Text("向上个页面回传值"),
              onPressed: () {
                Navigator.pop(context, ["来自PageD的回传参数"]); // 往回传一个数组
                // Navigator.pop(context,"来自PageA的回传参数");// 往回传一个字符串
              },
            ),
          ),
          // Container(
          //   child: RaisedButton(
          //       child: Text("向上个页面回传值"),
          //       onPressed: () {
          //         var result = Navigator.push(context,
          //             MaterialPageRoute(builder: (BuildContext context) {
          //           return PageB("这是传递给PageB的参数"); // 通过构造方法传递参数
          //         }));
          //       }),
          // ),
        ],
      )),
    );
  }
}
