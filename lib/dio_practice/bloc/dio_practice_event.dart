part of 'dio_practice_bloc.dart';

sealed class DioPracticeEvent extends Equatable {
  const DioPracticeEvent();

  @override
  List<Object> get props => [];
}

class DioPracticeInitEvent extends DioPracticeEvent {}
