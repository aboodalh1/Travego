import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';

abstract class ReserveTripRepo {
  Future<Either<Failure, String>> reserveTrip(
      {required num tripId, required List<Map<String, String>> information, required String token});

  Future<Either<Failure, Response>> editTripReservation(
      {required num reservationId,
      required List<Map<String, dynamic>> information});

  Future<Either<Failure, Response>> deleteReservation(
      {required num reservationId});

  Future<Either<Failure, Response>> getAllPassengers({required String token});

  Future<Either<Failure, Response>> getClientInfo({required String token});
  Future<Either<Failure, Response>> uploadImage({required String token,required String image});
  Future<Either<Failure, Response>> getMyInformation({required String token});
  Future<Either<Failure, Response>> getPassengerInformation({required String token,required num id});
}
