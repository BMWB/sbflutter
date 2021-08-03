/*
 * @Author: wangtianji
 * @Date: 2021-08-02 17:33:27
 * @LastEditTime: 2021-08-02 17:33:28
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/counter_cubit/sb_counter_observer.dart
 */

import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
