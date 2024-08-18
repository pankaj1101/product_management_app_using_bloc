part of 'cart_screen_bloc.dart';

@immutable
abstract class CartScreenState {}

abstract class CartScreenActionState extends CartScreenState {}

final class CartScreenInitial extends CartScreenState {
  final List<Products> products;
  CartScreenInitial({required this.products});
}

class ProductRemoveFromCartState extends CartScreenState {
  final Products product;

  ProductRemoveFromCartState({required this.product});
}

class ProductRemovedFromTheCartState extends CartScreenActionState {}
