/*
 * @Author: your name
 * @Date: 2021-07-28 10:44:56
 * @LastEditTime: 2021-07-28 11:09:04
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/scrollview/ssDataTable.dart
 */

import 'package:flutter/material.dart';

class ssDateTable extends StatefulWidget {
  ssDateTable({Key? key}) : super(key: key);

  static String routeName = '/lib/scrollview/ssDataTable.dart';

  @override
  _ssDateTableState createState() => _ssDateTableState();
}

class _ssDateTableState extends State<ssDateTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          cccc(),
          dddd(),
        ],
      ),
    );
  }
}

class cccc extends StatefulWidget {
  cccc({Key? key}) : super(key: key);

  @override
  _ccccState createState() => _ccccState();
}

class _ccccState extends State<cccc> {
  List<User> data = [
    User('老孟', 18),
    User('老孟1', 19, selected: true),
    User('老孟2', 20),
    User('老孟3', 21),
    User('老孟4', 22),
  ];

  @override
  Widget build(BuildContext context) {
    List<DataRow> dateRows = [];
    for (int i = 0; i < data.length; i++) {
      dateRows.add(DataRow(
        selected: data[i].selected,
        onSelectChanged: (selected) {
          setState(() {
            data[i].selected = selected!;
          });
        },
        cells: [
          DataCell(Text('${data[i].name}')),
          DataCell(Text('${data[i].age}')),
        ],
      ));
    }

    return DataTable(columns: [
      DataColumn(label: Text('姓名')),
      DataColumn(
        label: Text('年龄'),
      ),
    ], rows: dateRows);
  }
}

class dddd extends StatefulWidget {
  dddd({Key? key}) : super(key: key);

  @override
  _ddddState createState() => _ddddState();
}

class _ddddState extends State<dddd> {
  List<User> data = [
    User('老孟', 18),
    User('老孟1', 19, selected: true),
    User('老孟2', 20),
    User('老孟3', 21),
    User('老孟4', 22),
  ];

  @override
  Widget build(BuildContext context) {
    List<DataRow> dateRows = [];
    for (int i = 0; i < data.length; i++) {
      dateRows.add(DataRow(
        cells: [
          DataCell(Text('${data[i].name}')),
          DataCell(Text('${data[i].age}')),
          DataCell(Text('男')),
          DataCell(Text('2020')),
          DataCell(Text('10')),
        ],
      ));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: [
        DataColumn(label: Text('姓名')),
        DataColumn(
          label: Text('年龄'),
        ),
        DataColumn(
          label: Text('性别'),
        ),
        DataColumn(
          label: Text('出生年份'),
        ),
        DataColumn(
          label: Text('出生月份'),
        ),
      ], rows: dateRows),
    );
  }
}

class User {
  User(this.name, this.age, {this.selected = false});

  String name;
  int age;
  bool selected;
}
