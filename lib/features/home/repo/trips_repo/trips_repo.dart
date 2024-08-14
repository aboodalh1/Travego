import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';

abstract class TripsRepo{

    Future<Either<Failure,Response>> getTrips({required String token});
    Future<Either<Failure,Response>> getTripServices({required String token});
    Future<Either<Failure,Response>> getTripById({required String token,required num id});
    Future<Either<Failure,Response>> getTripByCategory({required String token,required String category});
    Future<Either<Failure,Response>> getTripByStatus({required String token,required String status});
    Future<Either<Failure,String>> addTripToFavorite({required String token,required num id});
    Future<Either<Failure,String>> removeTripFromFavorite({required String token,required num id});
}