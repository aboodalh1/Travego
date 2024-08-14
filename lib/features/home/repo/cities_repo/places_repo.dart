import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';

abstract class PlacesRepo {
  Future<Either<Failure, String>> getAllPlaces({required String token});

  Future<Either<Failure, String>> getCityByPlace({required String token});

  Future<Either<Failure, String>> getPlaceById(
      {required String token, required int id});
}
