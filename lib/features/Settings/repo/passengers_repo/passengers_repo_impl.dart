import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo.dart';
import 'package:travego/model/remote/passenger/passenger_info_model.dart';
import 'package:travego/model/remote/passenger/passenger_passport_model.dart';
import 'package:travego/model/remote/passenger/passenger_personal_id_model.dart';
import 'package:travego/model/remote/passenger/passenger_visa_model.dart';

import '../../../../core/utils/network/remote/dio_helper.dart';

class PassengersRepoImpl implements PassengersRepo {
  final DioHelper dioHelper;

  PassengersRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, String>> addPassenger({

    required String firstName,
    required String lastName,
    required String fatherName,
    required String motherName,
    required String gender,
    required String token,
    required DateTime birthDate}) async {
    try {
      var response = await dioHelper
          .postData(endPoint: 'CLient/Account/Add_Client_Passenger', data: {
        "first_name": firstName,
        "last_name": lastName,
        "father_name": fatherName,
        "mother_name": motherName,
        "gender": gender,
        "birthdate": birthDate
      },token: token);
      return right(response.data['message']);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addPassengerPassport(
      {required String passportFirstName,
        required String passportLastName,
        required String passportNumber,
        required String issueDate,
        required String token,
        required String expiredDate,
        required num passengerId}) async {
    try {
      var response = await dioHelper
          .postData(endPoint: 'CLient/Account/Add_Passenegr_Passport', data: {
        "passportfirstName": passportFirstName,
        "passportlastName": passportLastName,
        "passportIssueDate": issueDate,
        "passportExpiryDate": expiredDate,
        "passportNumber": passportNumber,
        "passengerId": passengerId
      },token: token);
      return right(response.data['message']);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addPassengerPersonalId(
      {required String idfirstName,
        required String idlastName,
        required String idBirthDate,
        required String nationality,
        required String token,
        required num passengerId}) async {
    try {
      var response = await dioHelper
          .postData(endPoint: 'CLient/Account/Add_Passenger_Personalid', data: {
        "idfirstName": idfirstName,
        "idlastName": idlastName,
        "idBirthDate": idBirthDate,
        "nationality": nationality,
        "passengerId": passengerId
      },token: token);
      return right(response.data['message']);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addPassengerVisa({required String visaType,
    required String country,
    required String issueDate,
    required String expiredDate,
    required String token,
    required num passengerId}) async {
    try {
      var response = await dioHelper
          .postData(endPoint: 'CLient/Account/Add_Passenger_Visa', data: {
        "visaType": visaType,
        "country": country,
        "visaIssueDate": issueDate,
        "visaExpiryDate": expiredDate,
        "passengerId": passengerId
      }, token: token);
      return right(response.data['message']);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PassengerInfoModel>> getAllPassengers(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_All_Client_Passengers', token: token);
      return right(response.data);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PassengerPassportModel>> getPassengerPassport(
      {required String token,required num id}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_Passenger_Passport/$id', token: token);
      return right(response.data);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PassengerPersonalIdModel>> getPassengerPersonalId(
      {required String token,required num id}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_Passenger_PersonalId/$id', token: token);
      return right(response.data);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PassengerVisaModel>> getPassengerVisa(
      {required String token,required num id}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_Passenger_Visa/$id', token: token);
      return right(response.data);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
