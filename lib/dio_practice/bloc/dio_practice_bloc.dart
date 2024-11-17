import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/models/products_model.dart';
import 'package:learn_bloc/repository/product_repository.dart';

part 'dio_practice_event.dart';
part 'dio_practice_state.dart';

class DioPracticeBloc extends Bloc<DioPracticeEvent, DioPracticeState> {
  DioPracticeBloc() : super(DioPracticeInitial()) {
    on<DioPracticeInitEvent>(_dioPracticeInitEvent);
  }

  Future<void> _dioPracticeInitEvent(
      DioPracticeInitEvent event, Emitter<DioPracticeState> emit) async {
    ProductRepository productsRepository = ProductRepository();

    try {
      emit(DioPracticeLoadingState());
      final ProductsModel? data =
          await productsRepository.getProductDetailsUsingDio();
      if (data != null) {
        emit(DioPracticeSuccessState(data));
      } else {
        emit(const DioPracticeFailureState(
            errorMessage: 'product data is null'));
      }
    } catch (e) {
      print(e);
      emit(const DioPracticeFailureState(errorMessage: 'Someting went wrong'));
    }
  }
}
