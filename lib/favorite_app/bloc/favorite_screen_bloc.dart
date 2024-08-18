import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/favorite_app/bloc/favorite_screen_event.dart';
import 'package:learn_bloc/favorite_app/bloc/favorite_screen_state.dart';

class FavoriteScreenBloc
    extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  FavoriteScreenBloc() : super(FavoriteScreenInitial(nameList: [])) {
    on<AddFavoriteList>(_addToFavoriteList);
    on<RemoveFavoriteList>(_removeFromFavoriteList);
  }
  FutureOr<void> _addToFavoriteList(
      AddFavoriteList event, Emitter<FavoriteScreenState> emit) {
    final currentState = state as FavoriteScreenInitial;
    bool checkIsPersonExit = checkPersonExitsInList(event.name);
    if (!checkIsPersonExit) {
      currentState.nameList.add(event.name);
    } else {
      emit(
        PersonAlreadyExistsState(
          nameList: currentState.nameList,
          message: 'Already Exits',
        ),
      );
    }
    emit(FavoriteScreenInitial(nameList: currentState.nameList));
  }

  FutureOr<void> _removeFromFavoriteList(
      RemoveFavoriteList event, Emitter<FavoriteScreenState> emit) {
    final currentState = state as FavoriteScreenInitial;
    currentState.nameList.remove(event.name);
    emit(FavoriteScreenInitial(nameList: currentState.nameList));
  }

  bool checkPersonExitsInList(String name) {
    return (state as FavoriteScreenInitial).nameList.contains(name);
  }
}
