/*
 * @Author: wangtianji
 * @Date: 2021-08-11 10:22:37
 * @LastEditTime: 2021-08-11 11:16:50
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/12_Data_network/sb_path_provider.dart
 */

library PathProviderDemo;

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
                'getTemporaryDirectory',
                '临时目录，适用于下载的缓存文件，此目录随时可以清除，此目录为应用程序私有目录，其他应用程序无法访问此目录。',
                _tempDirectory),
            _buildItem(
                'getApplicationSupportDirectory',
                "应用程序可以在其中放置应用程序支持文件的目录的路径。将此文件用于您不想向用户公开的文件。 您的应用不应将此目录用于存放用户数据文件。",
                _appSupportDirectory),
            _buildItem(
                'getLibraryDirectory',
                "应用程序可以在其中存储持久性文件，备份文件以及对用户不可见的文件的目录路径，例如storage.sqlite.db。",
                _appLibraryDirectory),
            _buildItem(
                'getApplicationDocumentsDirectory',
                "应用程序可能在其中放置用户生成的数据或应用程序无法重新创建的数据的目录路径。",
                _appDocumentsDirectory),
            _buildItem(
                'getExternalStorageDirectory',
                "应用程序可以访问顶级存储的目录的路径。由于此功能仅在Android上可用，因此应在发出此函数调用之前确定当前操作系统。",
                _externalStorageDirectory),
            _buildItem('getDownloadsDirectory', "", _downloadDirectory),
            _buildItem1(
                'getExternalStorageDirectories',
                "可以存储应用程序特定数据的目录的路径。 这些路径通常位于外部存储（如单独的分区或SD卡）上。 由于此功能仅在Android上可用，因此应在发出此函数调用之前确定当前操作系统。 在iOS上，此功能会抛出UnsupportedError，因为这是不可能的在应用程序的沙箱外部访问。",
                _externalStorageDirectories),
            _buildItem1(
                'getExternalCacheDirectories',
                "存储特定于应用程序的外部缓存数据的目录的路径。 这些路径通常位于外部存储（如单独的分区或SD卡）上。 电话可能具有多个可用的存储目录。 由于此功能仅在Android上可用，因此应在发出此函数调用之前确定当前操作系统。 在iOS上，此功能会抛出UnsupportedError，因为这是不可能的在应用程序的沙箱外部访问。",
                _externalCacheDirectories),
          ],
        ),
      ),
    );
  }
}
