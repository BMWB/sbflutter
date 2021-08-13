/*
 * @Author: wangtianji
 * @Date: 2021-08-03 17:03:33
 * @LastEditTime: 2021-08-03 17:08:18
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/infinitelist/app.dart
 */

import 'package:flutter/material.dart';
import 'posts.dart';
import 'package:bloc/bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

class App extends MaterialApp {
  App() : super(home: PostsPage());
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
