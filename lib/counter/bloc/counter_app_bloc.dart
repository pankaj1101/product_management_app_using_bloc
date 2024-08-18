import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/counter/bloc/counter_app_state.dart';

part 'counter_app_event.dart';

class CounterAppBloc extends Bloc<CounterAppEvent, CounterAppState> {
  CounterAppBloc() : super(CounterAppInitial(counter: 0)) {
    // on<CounterAppEvent>((event, emit) {});
    on<Increment>(_increment);
    on<IsCheckedEvent>(_isChecked);
  }

  FutureOr<void> _increment(Increment event, Emitter<CounterAppState> emit) {
    final currentState = state as CounterAppInitial;

    if (currentState.isChecked) {
      emit(
        CounterAppInitial(
          counter: currentState.counter + 1,
          isChecked: currentState.isChecked,
        ),
      );
    } else {
      print('pls check the box');
    }
  }

  FutureOr<void> _isChecked(
      IsCheckedEvent event, Emitter<CounterAppState> emit) {
    final currentState = (state as CounterAppInitial);
    emit(currentState.copyWith(isChecked: event.isChecked));
  }
}
