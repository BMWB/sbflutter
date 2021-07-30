/*
 * @Author: wangtianji
 * @Date: 2021-07-30 10:21:37
 * @LastEditTime: 2021-07-30 10:27:26
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/08_functional/sbInteractiveViewer.dart
 */
import 'package:flutter/material.dart';
import 'dart:math';

main(List<String> args) {
  runApp(MaterialApp(
    home: InteractiveViewerDemo(),
  ));
}

///
/// desc:
///

class InteractiveViewerDemo extends StatefulWidget {
  @override
  _InteractiveViewerDemoState createState() => _InteractiveViewerDemoState();
}

class _InteractiveViewerDemoState extends State<InteractiveViewerDemo> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: InteractiveViewer(
                child: Container(
                  color: Colors.blue,
                  width: 300,
                  height: 300,
                ),
                transformationController: _transformationController,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            children: [
              RaisedButton(
                child: Text('重置'),
                onPressed: () {
                  _transformationController.value = Matrix4.identity();
                },
              ),
              RaisedButton(
                child: Text('左移'),
                onPressed: () {
                  var matrix = _transformationController.value.clone();
                  matrix.translate(-5.0);
                  _transformationController.value = matrix;
                },
              ),
              RaisedButton(
                child: Text('放大'),
                onPressed: () {
                  var matrix = _transformationController.value.clone();
                  matrix.scale(1.5, 1.0, 1.0);
                  _transformationController.value = matrix;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
