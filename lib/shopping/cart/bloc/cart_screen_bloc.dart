import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/cart_items.dart';
import 'package:learn_bloc/models/products_model.dart';
import 'package:meta/meta.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenInitial(products: const <Products>[])) {
    on<CartScreenInitialEvent>(_getProductCartData);
    on<ProductRemoveFromCartEvent>(_removeProductFromCart);
  }

  FutureOr<void> _getProductCartData(
      CartScreenInitialEvent event, Emitter<CartScreenState> emit) {
    emit(CartScreenInitial(products: event.products));
  }

  FutureOr<void> _removeProductFromCart(
      ProductRemoveFromCartEvent event, Emitter<CartScreenState> emit) {
    cartItem.remove(event.product);
    emit(ProductRemovedFromTheCartState());
    emit(CartScreenInitial(products: cartItem));
  }
}
