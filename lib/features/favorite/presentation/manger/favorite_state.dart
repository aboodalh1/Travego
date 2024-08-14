abstract class FavoriteState{}

class FavoriteInitial extends FavoriteState{}

class FavoriteLoading extends FavoriteState{}

class GetFavoriteSuccess extends FavoriteState{}

class AddToFavorite extends FavoriteState{}

class RemoveFromFavorite extends FavoriteState{}

class GetFavoriteError extends FavoriteState{
  final String error;

  GetFavoriteError({required this.error});
}


