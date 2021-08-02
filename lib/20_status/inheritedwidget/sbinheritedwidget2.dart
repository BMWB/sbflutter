/*
 * @Author: wangtianji
 * @Date: 2021-08-02 15:35:23
 * @LastEditTime: 2021-08-02 15:47:08
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/inheritedwidget/sbinheritedwidget2.dart
 */
import 'package:flutter/material.dart';
import 'state_container/sb_form_page.dart';
import 'state_container/state_container.dart';

void main() {
  runApp(new StateContainer(child: new TodoApp()));
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Some Todos',
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  User? user;

  Widget get _userInfo {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text("${user!.firstName} ${user!.lastName}",
              style: new TextStyle(fontSize: 24.0)),
          new Text(user!.email, style: new TextStyle(fontSize: 24.0)),
        ],
      ),
    );
  }

  Widget get _logInPrompt {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text('Please add user information'),
        ],
      ),
    );
  }

  void _updateUser(BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return new UpdateUserScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    user = container!.user;
    var body = user != null ? _userInfo : _logInPrompt;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Inherited Widget Test'),
      ),
      body: body,
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _updateUser(context),
        child: new Icon(Icons.edit),
      ),
    );
  }
}
