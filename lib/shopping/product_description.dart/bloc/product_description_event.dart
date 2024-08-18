part of 'product_description_bloc.dart';

@immutable
abstract class ProductDescriptionEvent {}

class ProductDescriptionInitialEvent extends ProductDescriptionEvent {
  final int productID;
  ProductDescriptionInitialEvent({required this.productID});
}

class ProductAddToCartEvent extends ProductDescriptionEvent {
  final Products product;
  ProductAddToCartEvent({required this.product});
}
