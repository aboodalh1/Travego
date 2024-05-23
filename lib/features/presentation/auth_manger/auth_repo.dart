import 'package:dartz/dartz.dart';
import 'package:travego/model/user_model.dart';

import '../../../core/errors/failure.dart';

abstract class AuthRepo{

  Future<Either<Failure, String>> register(
  {
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,

}
      );
  Future<Either<Failure, String >> login({
    required String email,
    required String password,
});
  Future<Either<Failure, UserModel>> getUserInfo(
      {required String token});
  Future<Either<Failure, String >> verificationCode(
      {required String code, required String email});
}