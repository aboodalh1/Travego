import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';

abstract class ReserveTripRepo {
  Future<Either<Failure, Response>> reserveTrip(
      {required num tripId, required List<Map<String, dynamic>> information});

  Future<Either<Failure, Response>> editTripReservation(
      {required num reservationId,
      required List<Map<String, dynamic>> information});

  Future<Either<Failure, Response>> deleteReservation(
      {required num reservationId});

  Future <Either<Failure,Response>> getAllPassengers({
    required String token
  });
}
