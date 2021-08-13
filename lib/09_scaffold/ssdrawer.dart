/*
 * @Author: your name
 * @Date: 2021-07-28 16:36:29
 * @LastEditTime: 2021-07-28 16:37:39
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/scaffold/ssdrawer.dart
 */

import 'package:flutter/material.dart';

class ssdrawer extends StatefulWidget {
  ssdrawer({Key? key}) : super(key: key);

  @override
  _ssdrawerState createState() => _ssdrawerState();
}

class _ssdrawerState extends State<ssdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // data-width:100,
        width: 100,
        child: ListView(
          children: <Widget>[
            //一些布局样式
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2491682377,1019940373&fm=26&gp=0.jpg"),
                      fit: BoxFit.cover)),
              child: ListView(
                children: <Widget>[Text('我来组成头部')],
              ),
            ),
            ListTile(
              title: Text("隐藏侧边栏"),
              leading: CircleAvatar(child: Icon(Icons.people)),
              onTap: () {
                Navigator.of(context).pop(); //隐藏侧边栏
              },
            ),
          ],
        ),
      ),
    );
  }
}
