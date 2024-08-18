import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/counter/bloc/counter_app_bloc.dart';
import 'package:learn_bloc/counter/bloc/counter_app_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: BlocBuilder<CounterAppBloc, CounterAppState>(
        builder: (context, state) {
          state as CounterAppInitial;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please check to increase the value'),
              Text(
                state.counter.toString(),
                textScaleFactor: 10,
              ),
              Checkbox(
                value: state.isChecked,
                onChanged: (value) {
                  context
                      .read<CounterAppBloc>()
                      .add(IsCheckedEvent(isChecked: value!));
                },
              ),
            ],
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        onPressed: () {
          context.read<CounterAppBloc>().add(Increment());
        },
        child: const Text('+'),
      ),
    );
  }
}
