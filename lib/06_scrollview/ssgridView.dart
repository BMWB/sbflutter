/*
 * @Author: your name
 * @Date: 2021-07-27 21:51:05
 * @LastEditTime: 2021-07-29 15:49:33
 * @LastEditors: wangtianji
 * @Description: In User Settings Edit
 * @FilePath: /SSFlutter/lib/06_scrollview/ssgridView.dart
 */

import 'package:flutter/material.dart';
// import 'package:ssflutter/navigator/anonymous_Routes.dart';

class ssgridView extends StatefulWidget {
  ssgridView({Key? key}) : super(key: key);

  static String routeName = '/lib/scrollview/ssgridView.dart';

  @override
  _ssgridViewState createState() => _ssgridViewState();
}

class _ssgridViewState extends State<ssgridView> {
  List listData = [
    {
      "title": "标题1",
      "author": "内容1",
      "image": "https://www.itying.com/images/flutter/1.png"
    },
    {
      "title": "标题2",
      "author": "内容2",
      "image": "https://www.itying.com/images/flutter/2.png"
    },
    {
      "title": "标题3",
      "author": "内容3",
      "image": "https://www.itying.com/images/flutter/3.png"
    },
    {
      "title": "标题4",
      "author": "内容4",
      "image": "https://www.itying.com/images/flutter/4.png"
    },
    {
      "title": "标题5",
      "author": "内容5",
      "image": "https://www.itying.com/images/flutter/5.png"
    },
    {
      "title": "标题6",
      "author": "内容6",
      "image": "https://www.itying.com/images/flutter/6.png"
    },
    {
      "title": "标题7",
      "author": "内容7",
      "image": "https://www.itying.com/images/flutter/7.png"
    },
    {
      "title": "标题8",
      "author": "内容8",
      "image": "https://www.itying.com/images/flutter/1.png"
    },
    {
      "title": "标题9",
      "author": "内容9",
      "image": "https://www.itying.com/images/flutter/2.png"
    }
  ];

  List<Widget> _getData() {
    List<Widget> list = [];
    for (var i = 0; i < listData.length; i++) {
      list.add(Container(
        child: ListView(
          children: [
            Image.network(
              listData[i]["image"],
              fit: BoxFit.cover,
            ),
            Text(
              listData[i]["title"],
              textAlign: TextAlign.center,
            )
          ],
        ),
//
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black26, width: 1)),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        //设置滚动方向
        scrollDirection: Axis.vertical,
        //设置列数
        crossAxisCount: 3,
        //设置内边距
        padding: EdgeInsets.all(10),
        //设置横向间距
        crossAxisSpacing: 10,
        //设置主轴间距
        mainAxisSpacing: 10,
        children: _getData(),
      ),
    );
  }
}
