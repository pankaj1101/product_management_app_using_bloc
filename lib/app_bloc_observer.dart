import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('Bloc ${bloc.runtimeType} has changed: $change');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    print('Bloc ${bloc.runtimeType} has been closed.');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    print('Bloc ${bloc.runtimeType} has been created.');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Error in Bloc ${bloc.runtimeType}: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('Bloc ${bloc.runtimeType} has transitioned: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('Bloc ${bloc.runtimeType} received event: $event');
    super.onEvent(bloc, event);
  }
}
