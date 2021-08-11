/*
 * @Author: wangtianji
 * @Date: 2021-08-11 14:31:59
 * @LastEditTime: 2021-08-11 14:37:15
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/12_data_network/sb_sqlite.dart
 */

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DBProvider {
  static final DBProvider _singleton = DBProvider._internal();

  factory DBProvider() {
    return _singleton;
  }

  DBProvider._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'dbName');
    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  ///
  /// 创建Table
  ///
  Future _onCreate(Database db, int version) async {}

  ///
  /// 更新Table
  ///
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  Future saveData(User user) async {
    var _db = await db;
    return await _db.insert('User', user.toJson());
  }
}

class User {
  int? id;
  String? name;
  int? age;
  int? sex;

  User({this.id, this.name, this.age, this.sex});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['sex'] = this.sex;
    return data;
  }
}

class AddUser extends StatefulWidget {
  static const String routeName = '/lib/12_data_network/sb_sqlite.dart';

  @override
  __AddUserState createState() => __AddUserState();
}

class __AddUserState extends State<AddUser> {
  String _radioGroupValue = '0';
  late TextEditingController _nameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保存数据'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('姓名：'),
              Flexible(
                child: TextField(
                  controller: _nameController,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('年龄：'),
              Flexible(
                child: TextField(
                  controller: _ageController,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('性别：'),
              Flexible(
                child: RadioListTile(
                  title: Text('男'),
                  value: '0',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value as String;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  title: Text('女'),
                  value: '1',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value as String;
                    });
                  },
                ),
              ),
            ],
          ),
          Builder(
            builder: (context) {
              return RaisedButton(
                child: Text('保存'),
                onPressed: () async {
                  var user = User(
                      name: '${_nameController.text}',
                      age: int.parse('${_ageController.text}'),
                      sex: int.parse('$_radioGroupValue'));

                  int result = await DBProvider().saveData(user);
                  if (result > 0) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('保存数据成功，result:$result'),
                    ));
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('保存数据失败，result:$result'),
                    ));
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
