import 'package:bloc/bloc.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

    void removeFavorite() {
      emit(RemoveFromFavorite());
    }

    void getFavorite() {
      emit(FavoriteLoading());
    }
  }