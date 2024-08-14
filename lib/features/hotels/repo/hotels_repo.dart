import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';

abstract class HotelsRepo{

    Future<Either<Failure,Response>> getHotels({required String token});
    Future <Either<Failure,Response>>getHotelById({required String token,required num id});


}

