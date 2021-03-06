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
                'getTemporaryDirectory', '????????????????????????(IOS???????????????)', _tempDirectory),
            _buildItem('getApplicationSupportDirectory', "????????????????????????(IOS???????????????)",
                _appSupportDirectory),
            _buildItem('getLibraryDirectory', "????????????????????????????????????(???IOS??????)",
                _appLibraryDirectory),
            _buildItem('getApplicationDocumentsDirectory', "????????????????????????(IOS???????????????)",
                _appDocumentsDirectory),
            _buildItem('getExternalStorageDirectory', "????????????????????????(???????????????)",
                _externalStorageDirectory),
            _buildItem('getDownloadsDirectory', "??????????????????(??????????????? ?????????IOS??????)",
                _downloadDirectory),
            _buildItem1('getExternalStorageDirectories', "??????????????????????????????(???????????????)",
                _externalStorageDirectories),
            _buildItem1('getExternalCacheDirectories', "????????????????????????(???????????????)",
                _externalCacheDirectories),
          ],
        ),
      ),
    );
  }
}

//??????????????????
_createDir() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}${Platform.pathSeparator}dirName';
  var dir = Directory(path);
  var exist = dir.existsSync();
  if (exist) {
    print('???????????????????????????');
  } else {
    var result = await dir.create();
    print('$result');
  }
}

//???????????????
_dirList() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}${Platform.pathSeparator}dirName';

  Stream<FileSystemEntity> fileList = Directory(path).list();

  await for (FileSystemEntity fileSystemEntity in fileList) {
    print('$fileSystemEntity');
  }
}

//?????????
_dirRename() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}${Platform.pathSeparator}dirName';
  var dir = Directory(path);
  var dir3 = await dir
      .rename('${dir.parent.absolute.path}${Platform.pathSeparator}dir3');
}

//??????????????????
_deleteDir() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}${Platform.pathSeparator}dir3';
  var dir = await Directory(path).delete();
}

//???????????? file.txt ?????????
_createFile() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path =
      '${documentsDirectory.path}${Platform.pathSeparator}dirName${Platform.pathSeparator}file.txt';

  var file = await File(path).create(recursive: true);
//??? file.txt ????????????????????????
  file.writeAsString('?????? Flutter');
//??? file.txt ???????????? bytes ?????????
  file.writeAsBytes(Utf8Encoder().convert("?????? Flutter bytes ??????"));
//???????????????????????????????????????????????????????????????
  file.openWrite(mode: FileMode.append).write('?????? Flutter ???????????????');

//??????????????????????????????
  List<String> lines = await file.readAsLines();
  lines.forEach((element) {
    print('$element');
  });

// ?????? bytes ????????????String???
  Utf8Decoder().convert(await file.readAsBytes());
//??????
  file.delete();
}
