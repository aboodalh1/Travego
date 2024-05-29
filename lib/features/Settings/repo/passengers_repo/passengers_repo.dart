import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/model/remote/passenger/passenger_info_model.dart';
import 'package:travego/model/remote/passenger/passenger_passport_model.dart';
import 'package:travego/model/remote/passenger/passenger_personal_id_model.dart';
import 'package:travego/model/remote/passenger/passenger_visa_model.dart';

abstract class PassengersRepo{

  Future<Either<Failure,String>> addPassenger({
    required String firstName,
    required String lastName,
    required String fatherName,
    required String motherName,
    required String gender,
    required DateTime birthDate,
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

  Future <Either<Failure,PassengerInfoModel>> getAllPassengers({
    required String token
});
  Future <Either<Failure,PassengerPassportModel>> getPassengerPassport({required String token, required num id});
  Future <Either<Failure,PassengerVisaModel>> getPassengerVisa({required String token,required num id});
  Future <Either<Failure,PassengerPersonalIdModel>> getPassengerPersonalId({required String token,required num id});
}