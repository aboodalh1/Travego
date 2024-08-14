import 'package:bloc/bloc.dart';
import 'package:travego/features/favorite/repo/favorite_repo.dart';
import '../../../../core/utils/shared/constant.dart';
import '../../../../model/remote/favorite/favorite_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
    FavoriteRepo favoriteRepo;
    FavoriteModel favoriteModel = FavoriteModel(message: 'message', status: 'status', localDateTime: 'localDateTime', body: Body(hotels: [], trips: []));
    void removeFavorite() {
      emit(RemoveFromFavorite());
    }

    Future<void> getFavorite() async{
      emit(FavoriteLoading());
      var result = await favoriteRepo.getFavorite(token: token);
      result.fold((failure) => {
        emit(GetFavoriteError(error: failure.errMessage))
      }, (response) {
      favoriteModel = FavoriteModel.fromJson(response.data);
      emit(GetFavoriteSuccess());

      });
    }
  }