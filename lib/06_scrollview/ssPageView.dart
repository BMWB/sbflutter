/*
 * @Author: your name
 * @Date: 2021-07-28 10:03:47
 * @LastEditTime: 2021-07-28 10:39:54
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /ssflutter/lib/scrollview/ssPageView.dart
 */

import 'package:flutter/material.dart';

class ssPageView extends StatefulWidget {
  ssPageView({Key? key}) : super(key: key);

  static String routeName = '/lib/scrollview/ssPageView.dart';

  @override
  _ssPageViewState createState() => _ssPageViewState();
}

class _ssPageViewState extends State<ssPageView> {
  var imgList = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2877516247,37083492&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2877516247,37083492&fm=26&gp=0.jpg'
  ];
  late PageController _pageController;

  var _currPageValue = 0.0;

  //Scaling factor
  double _scaleFactor = .8;

  //view page height
  double _height = 230.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: _height,
          child: PageView.builder(
            itemBuilder: (context, index) => _buildPageItem(index),
            itemCount: 10,
            controller: _pageController,
          )),
    );
  }

  _buildPageItem(int index) {
    double value;
    if (_pageController.position.haveDimensions) {
      value = (_pageController.page! - index);
    } else {
      // If haveDimensions is false, use _currentPage to calculate value.
      value = (_currPageValue - index).toDouble();
    }
    // We want the peeking cards to be 160 in height and 0.38 helps
    // achieve that.
    value = (1 - (value.abs() * .38)).clamp(0, 1).toDouble();
    return Transform(
      // transform: matrix4,
      transform: Matrix4.diagonal3Values(1.0, value, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(imgList[index % 2]), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
