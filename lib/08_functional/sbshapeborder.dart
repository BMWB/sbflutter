/*
 * @Author: wangtianji
 * @Date: 2021-07-29 18:12:01
 * @LastEditTime: 2021-07-29 18:24:33
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/08_functional/sbshapeborder.dart
 */

import 'dart:math';

import 'package:flutter/material.dart';

class sbshapeborder extends StatefulWidget {
  sbshapeborder({Key? key}) : super(key: key);

  static String routeName = '/lib/08_functional/sbshapeborder.dart';

  @override
  _sbshapeborderState createState() => _sbshapeborderState();
}

class _sbshapeborderState extends State<sbshapeborder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(100)),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(0)),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: Border(top: BorderSide(color: Colors.red, width: 2)),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: Border(
                top: BorderSide(color: Colors.red, width: 10),
                right: BorderSide(color: Colors.blue, width: 10),
                bottom: BorderSide(color: Colors.yellow, width: 10),
                left: BorderSide(color: Colors.green, width: 10),
              ),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: BorderDirectional(
                start: BorderSide(color: Colors.red, width: 2),
                end: BorderSide(color: Colors.blue, width: 2),
              ),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: CircleBorder(side: BorderSide(color: Colors.red)),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: ContinuousRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20)),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: StadiumBorder(
                side: BorderSide(color: Colors.red),
              ),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            RaisedButton(
              shape: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              child: Text('望京钢铁侠'),
              onPressed: () {},
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Container(
                    height: 150,
                    width: 150,
                    child: Container(
                      color: Colors.green,
                      width: 100,
                      height: 200,
                    )),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                width: 150,
                child: Container(
                    height: 150,
                    width: 150,
                    child: Container(
                      color: Colors.green,
                      width: 100,
                      height: 200,
                    )),
              ),
            ),
            ClipOval(
              child: Container(
                height: 150,
                width: 250,
                child: Container(
                    height: 150,
                    width: 150,
                    child: Container(
                      color: Colors.green,
                      width: 100,
                      height: 200,
                    )),
              ),
            ),
            ClipPath.shape(
              shape: StadiumBorder(),
              child: Container(
                height: 150,
                width: 250,
                child: Container(
                    height: 150,
                    width: 150,
                    child: Container(
                      color: Colors.green,
                      width: 100,
                      height: 200,
                    )),
              ),
            ),
            StartClip(),
          ],
        ),
      ),
    );
  }
}

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class StarPath extends CustomClipper<Path> {
  StarPath({this.scale = 2.5});

  final double scale;

  double perDegree = 36;

  /// 角度转弧度公式
  double degree2Radian(double degree) {
    return (pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    var R = min(size.width / 2, size.height / 2);
    var r = R / scale;
    var x = size.width / 2;
    var y = size.height / 2;

    var path = Path();
    path.moveTo(x, y - R);
    path.lineTo(x - sin(degree2Radian(perDegree)) * r,
        y - cos(degree2Radian(perDegree)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 2)) * R,
        y - cos(degree2Radian(perDegree * 2)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 3)) * r,
        y - cos(degree2Radian(perDegree * 3)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 4)) * R,
        y - cos(degree2Radian(perDegree * 4)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 5)) * r,
        y - cos(degree2Radian(perDegree * 5)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 6)) * R,
        y - cos(degree2Radian(perDegree * 6)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 7)) * r,
        y - cos(degree2Radian(perDegree * 7)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 8)) * R,
        y - cos(degree2Radian(perDegree * 8)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 9)) * r,
        y - cos(degree2Radian(perDegree * 9)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 10)) * R,
        y - cos(degree2Radian(perDegree * 10)) * R);
    return path;
  }

  @override
  bool shouldReclip(StarPath oldClipper) {
    return oldClipper.scale != this.scale;
  }
}

class StartClip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartClipState();
}

class _StartClipState extends State<StartClip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
    _animation = Tween(begin: 1.0, end: 4.0).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ClipPath(
              clipper: StarPath(scale: _animation.value),
              child: Container(
                height: 150,
                width: 150,
                color: Colors.red,
              ),
            );
          }),
    );
  }
}
