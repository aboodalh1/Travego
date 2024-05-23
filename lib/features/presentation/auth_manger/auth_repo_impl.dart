import 'package:dartz/dartz.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:travego/model/user_model.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failure.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final DioHelper dioHelper;

  AuthRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, String>> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var response =
          await dioHelper.postData(endPoint: 'Auth/Client_Register', data: {
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "phone_number": phone,
        "email": email,
        "password": password,
        "confirmation_password": password
      });
      print("email: ${email}");
      String result = response.data["message"];
      print(result);
      return right(result);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response =
          await dioHelper.postData(endPoint: 'Auth/Client_Login', data: {
        "email": email,
        "password": password,
      });
      String token = response.data['token'];
      return right(token);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserInfo(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(endPoint: 'url');
      UserModel userModel;
      userModel = UserModel.fromJson(response.data);
      return right(userModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verificationCode(
      {required String code, required String email}) async {
    try {
      var response = await dioHelper.postData(endPoint: 'Auth/Client_Check_Code', data: {
        "codeNumber": code,
        "user_email": email,
      });
      print(response.data['token']);
     String token = response.data['token'];
      return right(token);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
