import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure, String>> editProfile({
    required String token,
    required String firstName,
    required String lastName,
    required String username,
    required String phone,
  });

  Future<Either<Failure, String>> editPassword({
    required String token,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future <Either<Failure,String>> addMyPassport({
    required String passportFirstName,
    required String passportLastName,
    required String passportNumber,
    required String issueDate,
    required String expiredDate,
    required String token,
  });
  Future <Either<Failure,String>> addMyVisa({
    required String visaType,
    required String country,
    required String issueDate,
    required String expiredDate,
    required String token,
  });
  Future <Either<Failure,String>> addMyPersonalId({
    required String idfirstName,
    required String idlastName,
    required String idBirthDate,
    required String nationality,
    required String token,
  });
  Future <Either<Failure,String>> addMyDetails({
    required String fatherName,
    required String motherName,
    required String gender,
    required String birthDate,
    required String token,
  });

  Future <Either<Failure,Response>> getMyDetails({required String token});
  Future <Either<Failure,Response>> getMyPassport({required String token});
  Future <Either<Failure,Response>> getMyVisa({required String token,});
  Future <Either<Failure,Response>> getMyPersonalId({required String token});
  Future <Either<Failure,Response>> getMyInfo({required String token});
  Future <Either<Failure,String>> deleteMyPassport({required String token});
  Future <Either<Failure,String>> deleteMyVisa({required String token});
  Future <Either<Failure,String>> deleteMyPersonalId({required String token});
  Future<Either<Failure,String>> deleteMyAccount({required String token});
}
