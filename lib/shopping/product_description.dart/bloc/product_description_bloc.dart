import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learn_bloc/models/products_model.dart';
import 'package:learn_bloc/repository/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_description_event.dart';
part 'product_description_state.dart';

class ProductDescriptionBloc
    extends Bloc<ProductDescriptionEvent, ProductDescriptionState> {
  ProductDescriptionBloc() : super(ProductDescriptionInitial()) {
    on<ProductDescriptionInitialEvent>(_fetchProductDescriptionData);
  }

  Future<FutureOr<void>> _fetchProductDescriptionData(
      ProductDescriptionInitialEvent event,
      Emitter<ProductDescriptionState> emit) async {
    emit(ProductDescriptionLoadingState());
    try {
      final data =
          await ProductRepository().getProductDetailsById(event.productID);
      emit(ProductDescriptionSuccessState(product: data!));
    } catch (e) {
      emit(ProductDescriptionErrorState(message: e.toString()));
    }
  }
}
