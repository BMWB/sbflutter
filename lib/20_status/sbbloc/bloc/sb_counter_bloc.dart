/*
 * @Author: wangtianji
 * @Date: 2021-08-02 17:06:27
 * @LastEditTime: 2021-08-03 14:27:36
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/bloc/sb_counter_bloc.dart
 */
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sb_counter_event.dart';
part 'sb_counter_state.dart';

class SbCounterBloc extends Bloc<SbCounterEvent, SbCounterState> {
  SbCounterBloc() : super(SbCounterInitial());

  @override
  Stream<SbCounterState> mapEventToState(
    SbCounterEvent event,
  ) async* {
    if (event is SbFetchData) {
      yield SbCounterLoading();
      await Future.delayed(Duration(seconds: 2));
      yield SbCounterSuccess();
    }
  }
}
