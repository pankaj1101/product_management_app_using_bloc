part of 'product_screen_bloc.dart';

@immutable
abstract class ProductScreenState {}

abstract class ProductScreenActionState extends ProductScreenState {}

class ProductScreenInitial extends ProductScreenState {}

class ProductScreenLoadingState extends ProductScreenState {}

class ProductScreenSuccesState extends ProductScreenState {
  final ProductsModel? model;
  ProductScreenSuccesState({required this.model});
}

class ProductScreenErrorState extends ProductScreenState {
  final String message;
  ProductScreenErrorState({required this.message});
}

class SetProductIdState extends ProductScreenActionState {
  final int productId;
  SetProductIdState({required this.productId});
}

class ProductAddToCartState extends ProductScreenActionState {
  final List<Products> products;
  ProductAddToCartState({required this.products});
}

class NavigateToProductDescriptionScreenState
    extends ProductScreenActionState {}

class NavigateTOCartPageState extends ProductScreenActionState {}

class ProductAlreadyExitsInCartState extends ProductScreenActionState {}

class ProductAddedInCartState extends ProductScreenActionState {}
