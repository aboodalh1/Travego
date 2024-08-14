import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/failure.dart';

abstract class FavoriteRepo{
  Future<Either<Failure,Response>> getFavorite({required String token});
  Future<Either<Failure,String>> addFavorite({required String token});
  Future<Either<Failure,String>> removeFavorite({required String token});
}