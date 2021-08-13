import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'angular_counter_event.dart';
part 'angular_counter_state.dart';

class AngularCounterBloc extends Bloc<AngularCounterEvent, AngularCounterState> {
  AngularCounterBloc() : super(AngularCounterInitial());

  @override
  Stream<AngularCounterState> mapEventToState(
    AngularCounterEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
