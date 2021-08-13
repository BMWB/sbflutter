/*
 * @Author: wangtianji
 * @Date: 2021-08-11 10:22:37
 * @LastEditTime: 2021-08-11 14:28:36
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/12_Data_network/sb_path_provider.dart
 */

library PathProviderDemo;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderDemo extends StatefulWidget {
  const PathProviderDemo({Key? key}) : super(key: key);

  static const String routeName = '/lib/12_data_network/sb_path_provider.dart';

  @override
  _PathProviderDemoState createState() => _PathProviderDemoState();
}

class _PathProviderDemoState extends State<PathProviderDemo> {
  late Future<Directory> _tempDirectory;
  late Future<Directory> _appSupportDirectory;
  late Future<Directory> _appLibraryDirectory;
  late Future<Directory> _appDocumentsDirectory;
  late Future<Directory?> _externalStorageDirectory;
  late Future<List<Directory>?> _externalStorageDirectories;
  late Future<List<Directory>?> _externalCacheDirectories;
  late Future<Directory?> _downloadDirectory;

  @override
  void initState() {
    super.initState();
    setState(() {
      _tempDirectory = getTemporaryDirectory();
      _appSupportDirectory = getApplicationSupportDirectory();
      _appLibraryDirectory = getLibraryDirectory();
      _appDocumentsDirectory = getApplicationDocumentsDirectory();
      _externalStorageDirectory = getExternalStorageDirectory();
      _externalCacheDirectories = getExternalCacheDirectories();
      _externalStorageDirectories = getExternalStorageDirectories();
      _downloadDirectory = getDownloadsDirectory();
    });
  }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        text = Text('path: ${snapshot.data!.path}');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: text);
  }

  Widget _buildDirectories(
      BuildContext context, AsyncSnapshot<List<Directory>?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final String combined =
            snapshot.data!.map((Directory d) => d.path).join(', ');
        text = Text('paths: $combined');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16), child: text);
  }

  Widget _buildItem(String title, String sutitle, Future<Directory?> future) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        Expanded(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.amber, fontSize: 20, fontStyle: FontStyle.italic),
        )),
        SizedBox(height: 4),
        Expanded(
            child: Text(
          sutitle,
          style: TextStyle(color: Colors.green),
        )),
        SizedBox(height: 4),
        FutureBuilder<Directory?>(future: future, builder: _buildDirectory),
      ],
    );
  }

  Widget _buildItem1(
      String title, String sutitle, Future<List<Directory>?> future) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        Expanded(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.amber, fontSize: 20, fontStyle: FontStyle.italic),
        )),
        SizedBox(height: 4),
        Expanded(
            child: Text(
          sutitle,
          style: TextStyle(color: Colors.green),
        )),
        SizedBox(height: 4),
        FutureBuilder<List<Directory>?>(
            future: future, builder: _buildDirectories),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          itemExtent: 250,
          children: <Widget>[
            _buildItem(
                'getTemporaryDirectory', '获取临时文件路径(IOS和安卓通用)', _tempDirectory),
            _buildItem('getApplicationSupportDirectory', "获取应用支持目录(IOS和安卓通用)",
                _appSupportDirectory),
            _buildItem('getLibraryDirectory', "获取应用持久存储目录路径(仅IOS可用)",
                _appLibraryDirectory),
            _buildItem('getApplicationDocumentsDirectory', "获取应用文件目录(IOS和安卓通用)",
                _appDocumentsDirectory),
            _buildItem('getExternalStorageDirectory', "获取外部存储目录(仅安卓可用)",
                _externalStorageDirectory),
            _buildItem('getDownloadsDirectory', "获取下载目录(仅桌面可用 安卓和IOS报错)",
                _downloadDirectory),
            _buildItem1('getExternalStorageDirectories', "获取外部存储目录列表(仅安卓可用)",
                _externalStorageDirectories),
            _buildItem1('getExternalCacheDirectories', "获取外部缓存目录(仅安卓可用)",
                _externalCacheDirectories),
          ],
        ),
      ),
    );
  }
}

//创建文件夹：
_createDir() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}${Platform.pathSeparator}dirName';
  var dir = Directory(path);
  var exist = dir.existsSync();
  if (exist) {
    print('当前文件夹已经存在');
  } else {
    var result = await dir.create();
    print('$result');
  }
}

//遍历文件夹
_dirList() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}${Platform.pathSeparator}dirName';

  Stream<FileSystemEntity> fileList = Directory(path).list();

  await for (FileSystemEntity fileSystemEntity in fileList) {
    print('$fileSystemEntity');
  }
}

//重命名
_dirRename() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}${Platform.pathSeparator}dirName';
  var dir = Directory(path);
  var dir3 = await dir
      .rename('${dir.parent.absolute.path}${Platform.pathSeparator}dir3');
}

//删除文件夹：
_deleteDir() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}${Platform.pathSeparator}dir3';
  var dir = await Directory(path).delete();
}

//创建一个 file.txt 文件：
_createFile() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path =
      '${documentsDirectory.path}${Platform.pathSeparator}dirName${Platform.pathSeparator}file.txt';

  var file = await File(path).create(recursive: true);
//向 file.txt 文件写入字符串：
  file.writeAsString('老孟 Flutter');
//向 file.txt 文件写入 bytes 数据：
  file.writeAsBytes(Utf8Encoder().convert("老孟 Flutter bytes 格式"));
//上面两种方法都是覆盖写入，向末尾追加内容：
  file.openWrite(mode: FileMode.append).write('老孟 Flutter 追加到末尾');

//一行一行的读取数据：
  List<String> lines = await file.readAsLines();
  lines.forEach((element) {
    print('$element');
  });

// 读取 bytes 并转换为String：
  Utf8Decoder().convert(await file.readAsBytes());
//删除
  file.delete();
}
