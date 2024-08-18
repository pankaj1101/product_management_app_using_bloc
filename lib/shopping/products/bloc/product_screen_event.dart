part of 'product_screen_bloc.dart';

@immutable
abstract class ProductScreenEvent {}

class ProductInitialEvent extends ProductScreenEvent {}

class NavigateTOCartScreenEvent extends ProductScreenEvent {}

class NavigateToProductDescriptionScreenEvent extends ProductScreenEvent {}

class FetchProductData extends ProductScreenEvent {}

class SetProductID extends ProductScreenEvent {
  final int productID;
  SetProductID({required this.productID});
}

class ProductAddToCart extends ProductScreenEvent {
  final Products product;
  ProductAddToCart({required this.product});
}
