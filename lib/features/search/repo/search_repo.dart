import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';

abstract class SearchRepo{

  Future<Either<Failure,Response>> searchByTrip({required String text,required String token});
  Future<Either<Failure,Response>> searchByPlace({required String text,required String token});
  Future<Either<Failure,Response>> searchByHotel({required String text,required String token});
}