import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';

abstract class PassengersRepo{

  Future<Either<Failure,String>> addPassenger({
    required String firstName,
    required String lastName,
    required String fatherName,
    required String motherName,
    required String gender,
    required String birthDate,
    required String token,
});
  Future<Either<Failure,String>> editPassenger({
    required num id,
    required String firstName,
    required String lastName,
    required String fatherName,
    required String motherName,
    required String gender,
    required String birthDate,
    required String token,
});
  Future <Either<Failure,String>> addPassengerPassport({
    required String passportFirstName,
    required String passportLastName,
    required String passportNumber,
    required String issueDate,
    required String expiredDate,
    required num passengerId,
    required String token,
});
  Future <Either<Failure,String>> addPassengerVisa({
    required String visaType,
    required String country,
    required String issueDate,
    required String expiredDate,
    required num passengerId,
    required String token,
});
  Future <Either<Failure,String>> addPassengerPersonalId({
    required String idfirstName,
    required String idlastName,
    required String idBirthDate,
    required String nationality,
    required num passengerId,
    required String token,
});

  Future <Either<Failure,Response>> getAllPassengers({
    required String token
});
  Future <Either<Failure,Response>> getPassengerPassport({required String token, required num id});
  Future <Either<Failure,Response>> getPassengerVisa({required String token,required num id});
  Future <Either<Failure,Response>> getPassengerPersonalId({required String token,required num id});
  Future <Either<Failure,String>> deletePassenger({required String token,required num id});
  Future <Either<Failure,String>> deletePassengerPassport({required String token,required num id});
  Future <Either<Failure,String>> deletePassengerVisa({required String token,required num id});
  Future <Either<Failure,String>> deletePassengerPersonalId({required String token,required num id});
}