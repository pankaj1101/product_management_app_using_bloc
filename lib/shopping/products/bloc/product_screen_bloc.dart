import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/data/cart_items.dart';
import 'package:learn_bloc/models/products_model.dart';
import 'package:learn_bloc/repository/product_repository.dart';
part 'product_screen_state.dart';
part 'product_screen_event.dart';

class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  ProductScreenBloc() : super(ProductScreenInitial()) {
    on<NavigateTOCartScreenEvent>(_navigateToCartScreen);
    on<ProductInitialEvent>(_productInitialEvent);
    on<NavigateToProductDescriptionScreenEvent>(
        _navigateToProductDescriptionScreen);
    on<SetProductID>(_setProductID);
    on<ProductAddToCart>(_productAddToCart);
  }
  FutureOr<void> _navigateToCartScreen(
      NavigateTOCartScreenEvent event, Emitter<ProductScreenState> emit) {
    emit(NavigateTOCartPageState());
  }

  void _setProductID(SetProductID event, Emitter<ProductScreenState> emit) {
    emit(SetProductIdState(productId: event.productID));
  }

  Future<FutureOr<void>> _productInitialEvent(
      ProductInitialEvent event, Emitter<ProductScreenState> emit) async {
    try {
      emit(ProductScreenLoadingState());
      final data = await ProductRepository().getProductDetails();
      emit(ProductScreenSuccesState(model: data!));
    } catch (e) {
      emit(ProductScreenErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _navigateToProductDescriptionScreen(
      NavigateToProductDescriptionScreenEvent event,
      Emitter<ProductScreenState> emit) {
    emit(NavigateToProductDescriptionScreenState());
  }

  FutureOr<void> _productAddToCart(
      ProductAddToCart event, Emitter<ProductScreenState> emit) {
    if (cartItem.contains(event.product)) {
      emit(ProductAlreadyExitsInCartState());
    } else {
      cartItem.add(event.product);
      emit(ProductAddedInCartState());
      emit(ProductAddToCartState(products: cartItem));
    }
  }
}
