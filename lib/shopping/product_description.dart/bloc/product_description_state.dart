part of 'product_description_bloc.dart';

@immutable
abstract class ProductDescriptionState {}

class ProductDescriptionInitial extends ProductDescriptionState {}

abstract class ProductDescriptionActionState extends ProductDescriptionState {}

class ProductDescriptionLoadingState extends ProductDescriptionState {}

class ProductDescriptionSuccessState extends ProductDescriptionState {
  final Products product;
  ProductDescriptionSuccessState({required this.product});
}

class ProductDescriptionErrorState extends ProductDescriptionState {
  final String message;
  ProductDescriptionErrorState({required this.message});
}
