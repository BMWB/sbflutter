/*
 * @Author: wangtianji
 * @Date: 2021-08-11 14:09:58
 * @LastEditTime: 2021-08-11 14:25:29
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/12_data_network/sb_path_shared.dart
 */

import 'package:shared_preferences/shared_preferences.dart';

//int
_saveData() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setInt('Key_Int', 12);
}

// 读取数据：int
Future<int> _readData() async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getInt('Key_Int');
  return result ?? 0;
}

// double
// 保存数据：

_saveDatad() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setDouble('Key_Double', 12.0);
}

Future<double> _readDatad() async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getDouble('Key_Double');
  return result ?? 0.0;
}

//bool
_saveDatab() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setBool('Key_Bool', true);
}

Future<bool> _readDatab() async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getBool('Key_Bool');
  return result ?? false;
}

// string
_saveDatas() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString('Key', 'laomeng');
}

Future<String> _readDatas() async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getString('Key');
  return result ?? '';
}

// stringlist
_saveDatasl() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setStringList('Key_StringList', ['laomeng', 'Flutter']);
}

Future<List<String>> _readDatasl() async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getStringList('Key_StringList');
  return result ?? [];
}

Future<bool> _deleteData() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.remove('Key');

  return true;
}

Future<bool> _clearData() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.clear();

  return true;
}

//获取所有key
Future<Set<String>?> _getKeys() async {
  var prefs = await SharedPreferences.getInstance();
  var keys = prefs.getKeys();
  return keys;
}

//检测是否 Key 是否存在：
Future<bool> _containsKey() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('Key');
}
