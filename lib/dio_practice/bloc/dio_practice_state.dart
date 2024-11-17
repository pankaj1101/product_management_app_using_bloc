part of 'dio_practice_bloc.dart';

sealed class DioPracticeState extends Equatable {
  const DioPracticeState();

  @override
  List<Object> get props => [];
}

final class DioPracticeInitial extends DioPracticeState {}

final class DioPracticeLoadingState extends DioPracticeState {}

final class DioPracticeSuccessState extends DioPracticeState {
  final ProductsModel productsModel;
  const DioPracticeSuccessState(this.productsModel);

  @override
  List<Object> get props => [productsModel];
}

final class DioPracticeFailureState extends DioPracticeState {
  final String errorMessage;
  const DioPracticeFailureState({required this.errorMessage});
}
