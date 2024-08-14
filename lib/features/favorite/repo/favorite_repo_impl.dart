import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/failure.dart';
import '../../../core/utils/network/remote/dio_helper.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo{
  final DioHelper dioHelper;

  FavoriteRepoImpl(this.dioHelper);
  @override
  Future<Either<Failure,Response>> getFavorite({required String token}) async{
    try{
      var response = await dioHelper.getData(endPoint: 'v1/favourite/all_my_favourites',token: token);
      return right(response);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addFavorite({required String token}) async{
    try{
      var response = await dioHelper.getData(endPoint: 'v1/favourite/add_trip_to_favorite',token: token);
      return right(response.data['message']);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeFavorite({required String token}) async{
    try{
      var response = await dioHelper.getData(endPoint: 'v1/favourite/remove_from_favorite',token: token);
      return right(response.data['message']);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}