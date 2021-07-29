/*
 * @Author: your name
 * @Date: 2021-07-28 14:16:12
 * @LastEditTime: 2021-07-28 20:13:24
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/navigator/sspush.dart
 */
import 'package:flutter/material.dart';
import './abcde/PageA.dart';

class sspush extends StatefulWidget {
  sspush({Key? key}) : super(key: key);

  static String routeName = '/lib/navigator/sspush.dart';

  @override
  _sspushState createState() => _sspushState();
}

class _sspushState extends State<sspush> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       // Scaffold.of(context).openDrawer();
          //     },
          //     icon: Icon(Icons.menu_book)),
          ),
      body: Center(
          child: Column(children: [
        RaisedButton(
          onPressed: () {
            // 接收一个Future的返回值，返回值是一个数组
            var result = Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return PageA("这是传递给PageA的参数"); // 通过构造方法传递参数
            }));
            // 获取返回值
            result.then((response) {
              this.setState(() {
                print("response===$response");
              });
            });
          },
          child: Text("push"),
        ),
        RaisedButton(
          onPressed: () async {
            // 接收一个Future的返回值，返回值是一个数组
            var result = Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return PageA("这是传递给PageA的参数");
            }));
            // 获取返回值
            result.then((response) {
              print("response===$response");
              // 页面已经出栈，不可再次调用
//                  this.setState((){
//                    text = response[0];
//                  });
            });
          },
          child: Text("pushReplacement"),
        ),
        RaisedButton(
          onPressed: () async {
            // 接收一个Future的返回值，返回值是一个数组
            var result = Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return PageA("这是传递给PageA的参数");
            }),
                // predicate参数
                (route) {
              print('route=$route}');
              // return false; // PageA之前的路由全部删除
              return true; // PageA之前的路由保持不变
            });
            // 获取返回值
            result.then((response) {
              print("response===$response");
              // 页面已经出栈，不可再次调用
//                  this.setState((){
//                    text = response[0];
//                  });
            });
          },
          child: Text("pushAndRemoveUntil"),
        ),
      ])),
    );
  }
}
