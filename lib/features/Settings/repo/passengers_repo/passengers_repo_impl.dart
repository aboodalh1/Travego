import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo.dart';

import '../../../../core/utils/network/remote/dio_helper.dart';

class PassengersRepoImpl implements PassengersRepo {
  final DioHelper dioHelper;

  PassengersRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, String>> addPassenger(
      {required String firstName,
      required String lastName,
      required String fatherName,
      required String motherName,
      required String gender,
      required String token,
      required String birthDate}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Add_Client_Passenger',
          data: {
            "first_name": firstName,
            "last_name": lastName,
            "father_name": fatherName,
            "mother_name": motherName,
            "gender": gender,
            "birthdate": birthDate,

          },
          token: token);
      return right(response.data['message']);
    } catch (e) {
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
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Add_Passenegr_Passport',
          data: {
            "passportfirstName": passportFirstName,
            "passportlastName": passportLastName,
            "passportIssueDate": issueDate,
            "passportExpiryDate": expiredDate,
            "passportNumber": passportNumber,
            "passengerId": passengerId,
            "passport_PHOTO": "string"
          },
          token: token);
      return right(response.data['message']);
    } catch (e) {
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
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Add_Passenger_Personalid',
          data: {
            "idfirstName": idfirstName,
            "idlastName": idlastName,
            "idBirthDate": idBirthDate,
            "nationality": nationality,
            "passengerId": passengerId,
            "personalIdentity_PHOTO": "string"

          },
          token: token);
      return right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addPassengerVisa(
      {required String visaType,
      required String country,
      required String issueDate,
      required String expiredDate,
      required String token,
      required num passengerId}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Add_Passenger_Visa',
          data: {
            "visaType": visaType,
            "country": country,
            "visaIssueDate": issueDate,
            "visaExpiryDate": expiredDate,
            "passengerId": passengerId,
            "visa_PHOTO": "string"
          },
          token: token);
      return right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getAllPassengers(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_All_Client_Passengers', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getPassengerPassport(
      {required String token, required num id}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_Passenger_Passport/$id', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getPassengerPersonalId(
      {required String token, required num id}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_Passenger_PersonalId/$id',
          token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getPassengerVisa(
      {required String token, required num id}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_Passenger_Visa/$id', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editPassenger(
      {required num id,
      required String firstName,
      required String lastName,
      required String fatherName,
      required String motherName,
      required String gender,
      required String birthDate,
      required String token}) async {
    try {
      var response = await dioHelper.putData(
          endPoint: 'CLient/Account/Edit_Client_Passenger',
          data: {
            "id": id,
            "first_name": firstName,
            "last_name": lastName,
            "father_name": fatherName,
            "mother_name": motherName,
            "gender": gender,
            "birthdate": birthDate,
          },
          token: token);
      return right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deletePassenger(
      {required String token, required num id}) async{
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'CLient/Account/Delete_Client_Passenger/$id', token: token);
      return right(response.data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deletePassengerPassport(
      {required String token, required num id}) async{
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'CLient/Account/Delete_Passenegr_Passport/$id', token: token);
      return right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deletePassengerPersonalId(
      {required String token, required num id}) async{
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'CLient/Account/Delete_Passenegr_PersonalId/$id', token: token);
      return right(response.data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deletePassengerVisa(
      {required String token, required num id}) async{
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'CLient/Account/Delete_Passenegr_Visa/$id', token: token);
      return right(response.data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
