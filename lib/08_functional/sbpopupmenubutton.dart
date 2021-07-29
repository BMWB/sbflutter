/*
 * @Author: wangtianji
 * @Date: 2021-07-29 17:41:41
 * @LastEditTime: 2021-07-29 18:09:23
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/08_functional/sbpopupmenubutton.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class sbpopupmenubutton extends StatefulWidget {
  sbpopupmenubutton({Key? key}) : super(key: key);

  static String routeName = '/lib/08_functional/sbpopupmenubutton.dart';

  @override
  _sbpopupmenubuttonState createState() => _sbpopupmenubuttonState();
}

class _sbpopupmenubuttonState extends State<sbpopupmenubutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: PopupMenuButton<String>(
              offset: Offset(0, 100),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              // icon: Icon(Icons.add),
              child: Text('学科'),
              elevation: 5,
              padding: EdgeInsets.all(5),
              color: Colors.red,
              tooltip: 'PopupMenuButton',
              onSelected: (value) {
                print('$value');
              },
              onCanceled: () {
                print('onCanceled');
              },
              initialValue: '语文',
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[
                  CheckedPopupMenuItem(
                    value: '哲理',
                    checked: true,
                    child: Text('哲理'),
                  ),
                  CheckedPopupMenuItem(
                    value: '外星',
                    child: Text('外星'),
                  ),
                  PopupMenuItem<String>(
                    value: '语文',
                    enabled: false,
                    child: Text('语文'),
                  ),
                  PopupMenuItem<String>(
                    value: '数学',
                    textStyle: TextStyle(color: Colors.red),
                    child: Text('数学'),
                  ),
                  PopupMenuDivider(height: 50),
                  PopupMenuItem<String>(
                    value: '英语',
                    height: 100,
                    child: Text('英语'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: '生物',
                    child: Text('生物'),
                  ),
                  PopupMenuItem<String>(
                    value: '化学',
                    child: Text('化学'),
                  ),
                ];
              },
            ),
          ),

          Container(
            height: 100,
            child: RaisedButton(
              child: Text('切换'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('提示'),
                        content: Text('确认删除吗？'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('取消'),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text('确认'),
                            onPressed: () {},
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
          Container(
            height: 100,
            child: RaisedButton(
              child: Text('带颜色'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('提示'),
                        content: Text('确认删除吗？'),
                        backgroundColor: Colors.lightBlueAccent,
                        elevation: 24,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('取消'),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text('确认'),
                            onPressed: () {},
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
          Container(
              height: 100,
              child: RaisedButton(
                child: Text('Navigator'),
                onPressed: () async {
                  var result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('提示'),
                          content: Text('确认删除吗？'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('取消'),
                              onPressed: () {
                                Navigator.of(context).pop('cancel');
                              },
                            ),
                            FlatButton(
                              child: Text('确认'),
                              onPressed: () {
                                Navigator.of(context).pop('ok');
                              },
                            ),
                          ],
                        );
                      });
                  print('$result');
                },
              )),
          Container(
            height: 100,
            child: RaisedButton(
              child: Text('CupertinoAlertDialog'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('提示'),
                        content: Text('确认删除吗？'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('取消'),
                            onPressed: () {},
                          ),
                          CupertinoDialogAction(
                            child: Text('确认'),
                            onPressed: () {},
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
          Container(
            height: 100,
            child: RaisedButton(
              child: Text('SimpleDialog'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text('提示'),
                        children: <Widget>[
                          Container(
                            height: 80,
                            alignment: Alignment.center,
                            child: Text('确认删除吗？'),
                          ),
                          Divider(
                            height: 1,
                          ),
                          FlatButton(
                            child: Text('取消'),
                            onPressed: () {
                              Navigator.of(context).pop('cancel');
                            },
                          ),
                          Divider(
                            height: 1,
                          ),
                          FlatButton(
                            child: Text('确认'),
                            onPressed: () {
                              Navigator.of(context).pop('ok');
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
          Container(
            height: 100,
            child: RaisedButton(
              child: Text('Dialog'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          color: Colors.amber,
                          width: 100,
                          height: 200,
                        ),
                      );
                    });
              },
            ),
          ), // Contai// Container(child:showMenu(context:context, position: RelativeRect.fill,, items: [])),
        ],
      ),
    );
  }
}
