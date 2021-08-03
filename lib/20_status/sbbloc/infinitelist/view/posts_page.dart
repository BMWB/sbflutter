/*
 * @Author: wangtianji
 * @Date: 2021-08-03 16:53:57
 * @LastEditTime: 2021-08-03 17:02:46
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/infinitelist/view/posts_page.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../posts.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) => PostBloc(http.Client())..add(PostFetched()),
        child: PostsList(),
      ),
    );
  }
}
