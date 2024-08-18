import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/slider/bloc/slider_screen_state.dart';
import 'slider_screen_event.dart';

class SliderScreenBloc extends Bloc<SliderScreenEvent, SliderScreenState> {
  SliderScreenBloc() : super(SliderScreenInitial(sliderValue: 0.0)) {
    on<SliderValue>(_sliderValue);
  }

  FutureOr<void> _sliderValue(
      SliderValue event, Emitter<SliderScreenState> emit) {
    emit(SliderScreenInitial(sliderValue: event.sliderValue));
  }
}
