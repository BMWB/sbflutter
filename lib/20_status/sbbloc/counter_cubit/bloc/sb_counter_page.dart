/*
 * @Author: wangtianji
 * @Date: 2021-08-02 17:15:15
 * @LastEditTime: 2021-08-03 15:38:38
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/counter_cubit/bloc/sb_counter_page.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sb_counter_cubit_cubit.dart';
import '../sb_counter_view.dart';
import 'sb_counter_observer.dart';

main(List<String> args) {
  Bloc.observer = CounterObserver();
  runApp(MaterialApp(
    home: SbCounterPage(),
  ));
}

class SbCounterPage extends StatelessWidget {
  const SbCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SbCounterCubitCubit(),
      child: SBCounterView(),
    );
  }
}
