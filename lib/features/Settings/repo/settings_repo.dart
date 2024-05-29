import 'package:dartz/dartz.dart';
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
}
