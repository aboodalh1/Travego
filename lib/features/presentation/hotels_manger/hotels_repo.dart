import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';

abstract class HotelsRepo{

    Future<Either<Failure,String>> getHotels({required String token});
    // Future<Either<Failure,String>> getTripServices({required String token});
    // Future<Either<Failure,String>> getTripById({required String token,required int id});
}