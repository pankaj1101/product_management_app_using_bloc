part of 'counter_app_bloc.dart';

abstract class CounterAppEvent {}

class Increment extends CounterAppEvent {}

class IsCheckedEvent extends CounterAppEvent {
  final bool isChecked;
  IsCheckedEvent({required this.isChecked});
}
