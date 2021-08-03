/*
 * @Author: wangtianji
 * @Date: 2021-08-03 16:59:12
 * @LastEditTime: 2021-08-03 16:59:12
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/infinitelist/widgets/bottom_loader.dart
 */

import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
