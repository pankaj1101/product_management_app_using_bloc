part of 'cart_screen_bloc.dart';

@immutable
abstract class CartScreenEvent {}

final class CartScreenInitialEvent extends CartScreenEvent {
  final List<Products> products;
  CartScreenInitialEvent({required this.products});
}

class ProductRemoveFromCartEvent extends CartScreenEvent {
  final Products product;

  ProductRemoveFromCartEvent({required this.product});
}
