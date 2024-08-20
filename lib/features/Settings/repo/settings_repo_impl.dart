import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/features/Settings/repo/settings_repo.dart';
import 'package:dio/dio.dart';
import '../../../core/utils/network/remote/dio_helper.dart';
import '../../../model/user_model.dart';

class SettingsRepoImpl implements SettingsRepo {
  final DioHelper dioHelper;

  SettingsRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, String>> editPassword(
      {required String token,
      required String oldPassword,
      required String newPassword,
      required String confirmPassword}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: 'Auth/Client_Change_Password',
          data: {
            "old_password": oldPassword,
            "new_password": newPassword,
            "confirm_password": confirmPassword,
          },
          token: token);
      return right(response.data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editProfile(
      {required String token,
      required String firstName,
      required String lastName,
      required String username,
      required String phone}) async {
    try {
      var response = await dioHelper.putData(
          endPoint: 'CLient/Account/Edit_My_Account',
          data: {
            "first_name": firstName,
            "last_name": lastName,
            "username": username,
            "phone_number": phone
          },
          token: token);
      globalUserModel = UserModel.fromJson(response.data);
      return right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addMyPassport({
    required String passportFirstName,
    required String passportLastName,
    required String passportNumber,
    required String issueDate,
    required String token,
    required String expiredDate,
  }) async {
    try {
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Add_Client_Passport',
          data: {
            "passportfirstName": passportFirstName,
            "passportlastName": passportLastName,
            "passportIssueDate": issueDate,
            "passportExpiryDate": expiredDate,
            "passport_number": passportNumber,
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
  Future<Either<Failure, String>> addMyPersonalId({
    required String idfirstName,
    required String idlastName,
    required String idBirthDate,
    required String nationality,
    required String token,
  }) async {
    try {
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Add_Client_Personalid',
          data: {
            "idfirstName": idfirstName,
            "idlastName": idlastName,
            "idBirthDate": idBirthDate,
            "nationality": nationality,
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
  Future<Either<Failure, String>> addMyVisa({
    required String visaType,
    required String country,
    required String issueDate,
    required String expiredDate,
    required String token,
  }) async {
    try {
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Add_Client_Visa',
          data: {
            "visa_Type": visaType,
            "visa_Country": country,
            "visaIssueDate": issueDate,
            "visaExpiryDate": expiredDate,
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
  Future<Either<Failure, Response>> getMyPassport(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_My_Passport', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getMyPersonalId(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_My_PersonalId', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getMyVisa({required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_My_Visa', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteMyPassport(
      {required String token}) async {
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'CLient/Account/Delete_My_Passport', token: token);
      return right('response.data');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteMyPersonalId(
      {required String token}) async {
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'CLient/Account/Delete_My_PersonalId', token: token);
      return right('response.data');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteMyVisa({required String token}) async {
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'CLient/Account/Delete_My_Visa', token: token);
      return right('response.data');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteMyAccount(
      {required String token}) async {
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'CLient/Account/Delete_My_Account', token: token);
      return right(response.data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getMyInfo({required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_My_Account', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getMyDetails(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_MyDetail', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addMyDetails(
      {required String fatherName,
      required String motherName,
      required String gender,
      required String birthDate,
      required String token}) async{
    try {
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Add_Client_Details',
          data: {
            "gender": gender,
            "birthDate": birthDate,
            "father_name": fatherName,
            "mother_name": motherName,
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
}
