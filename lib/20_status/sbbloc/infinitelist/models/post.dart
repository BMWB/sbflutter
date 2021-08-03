/*
 * @Author: wangtianji
 * @Date: 2021-08-03 16:14:13
 * @LastEditTime: 2021-08-03 16:15:45
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/infinitelist/models/Post.dart
 */

import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});

  @override
  List<Object> get props => [id, title, body];
}
