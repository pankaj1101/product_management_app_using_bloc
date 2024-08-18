abstract class CounterAppState {}

class CounterAppInitial extends CounterAppState {
  final int counter;
  bool isChecked;

  CounterAppInitial({
    required this.counter,
    this.isChecked = false,
  });

  CounterAppInitial copyWith({
    int? counter,
    bool? isChecked,
  }) {
    return CounterAppInitial(
      counter: counter ?? this.counter,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
