/*
 * @Author: wangtianji
 * @Date: 2021-08-03 10:53:52
 * @LastEditTime: 2021-08-03 11:01:52
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/navigation/bloc/sbnavigation_bloc.dart
 */
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
// import 'package:pigeon/ast.dart';

part 'sbnavigation_event.dart';
part 'sbnavigation_state.dart';

class SbnavigationBloc extends Bloc<SbnavigationEvent, SbnavigationState> {
  SbnavigationBloc() : super(SbnavigationInitial());

  SbnavigationState get initialState => SbnavigationInitial();

  @override
  Stream<SbnavigationState> mapEventToState(
    SbnavigationEvent event,
  ) async* {
    switch (event) {
      case SbnavigationEvent.eventA:
        yield SbnavigationInitial();
        break;
      default:
        yield SbnavigationBInitial();
    }
  }
}
