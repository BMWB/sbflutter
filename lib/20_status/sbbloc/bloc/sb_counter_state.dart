part of 'sb_counter_bloc.dart';

@immutable
abstract class SbCounterState {}

class SbCounterInitial extends SbCounterState {}

class SbCounterLoading extends SbCounterState {}

class SbCounterSuccess extends SbCounterState {}
