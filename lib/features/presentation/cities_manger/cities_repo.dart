import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';

abstract class CitiesRepo{

    Future<Either<Failure,String>> getAllCities({required String token});
    Future<Either<Failure,String>> getCityByCountry({required String token});
    Future<Either<Failure,String>> getCityById({required String token,required int id});
}