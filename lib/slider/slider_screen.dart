import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/slider/bloc/slider_screen_bloc.dart';
import 'package:learn_bloc/slider/bloc/slider_screen_event.dart';
import 'package:learn_bloc/slider/bloc/slider_screen_state.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SliderScreenBloc, SliderScreenState>(
        builder: (context, state) {
          state as SliderScreenInitial;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Move Slider to change opacity of container'),
              const SizedBox(height: 20),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(state.sliderValue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Slider(
                min: 0,
                max: 1,
                value: state.sliderValue,
                onChanged: (value) {
                  context
                      .read<SliderScreenBloc>()
                      .add(SliderValue(sliderValue: value));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
