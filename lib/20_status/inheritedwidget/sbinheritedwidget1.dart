/*
 * @Author: wangtianji
 * @Date: 2021-08-02 15:22:37
 * @LastEditTime: 2021-08-02 15:24:00
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/inheritedwidget/sbinheritedwidget.dart
 */

import 'package:flutter/material.dart';

void main() {
  runApp(new UserApp());
}

class UserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Widget get _logInPrompt {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Please add user information',
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  // All this method does is bring up the form page.
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Inherited Widget Test'),
      ),
      body: _logInPrompt,
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _updateUser(context),
        child: new Icon(Icons.edit),
      ),
    );
  }
}

class UpdateUserScreen extends StatelessWidget {
  static final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> firstNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> lastNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> emailKey =
      new GlobalKey<FormFieldState<String>>();

  const UpdateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Edit User Info'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          autovalidate: false,
          child: new ListView(
            children: [
              new TextFormField(
                key: firstNameKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              new TextFormField(
                key: lastNameKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              new TextFormField(
                key: emailKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'Email Address',
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form!.validate()) {
            var firstName = firstNameKey.currentState!.value;
            var lastName = lastNameKey.currentState!.value;
            var email = emailKey.currentState!.value;

            // Later, do some stuff here

            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
