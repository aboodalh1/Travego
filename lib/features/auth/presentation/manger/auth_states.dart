part of 'auth_cubit.dart';

abstract class AuthStates {}

class AuthInitState extends AuthStates {}

class ChangeSecure extends AuthStates {}

class AuthSuccessState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthFailureState extends AuthStates {
  final String error;

  AuthFailureState(this.error);
}

class CodeVerificationLoadingState extends AuthStates {}

class CodeVerifySuccess extends AuthStates {
  final String message;

  CodeVerifySuccess(this.message);
}

class CodeVerifyFailure extends AuthStates {
  final String error;

  CodeVerifyFailure(this.error);
}

class AuthInfoVerifyFailure extends AuthStates{}

class AuthInfoVerifySuccess extends AuthStates{}