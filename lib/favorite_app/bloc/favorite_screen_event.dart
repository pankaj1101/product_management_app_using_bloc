abstract class FavoriteScreenEvent {}

class AddFavoriteList extends FavoriteScreenEvent {
  final String name;

  AddFavoriteList(this.name);
}

class RemoveFavoriteList extends FavoriteScreenEvent {
  final String name;
  RemoveFavoriteList(this.name);
}
