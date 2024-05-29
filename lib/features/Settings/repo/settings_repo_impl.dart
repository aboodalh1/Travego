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
      print(e.toString());
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

      var response = await dioHelper
          .putData(endPoint: 'CLient/Account/Edit_My_Account', data: {
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "phone_number": phone
      },token: token);
      userModel=UserModel.fromJson(response.data);
      return right(response.data['message']);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
