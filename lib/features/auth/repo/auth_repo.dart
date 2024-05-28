import 'package:dartz/dartz.dart';
import 'package:travego/model/user_model.dart';

import '../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> regenerateVerificationCode({required String email});

  Future<Either<Failure, UserModel>> verificationCode(
      {required String code, required String email});

  Future<Either<Failure, String>> logout({required String token});
}
