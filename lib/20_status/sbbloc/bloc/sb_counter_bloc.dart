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
    // TODO: implement mapEventToState
  }
}
