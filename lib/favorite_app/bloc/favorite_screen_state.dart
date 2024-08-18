abstract class FavoriteScreenState {}

class FavoriteScreenInitial extends FavoriteScreenState {
  final List<String> nameList;
  FavoriteScreenInitial({required this.nameList});
}

class PersonAlreadyExistsState extends FavoriteScreenState {
  final List<String> nameList;
  final String message;

  PersonAlreadyExistsState({required this.nameList, required this.message});
}