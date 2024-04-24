abstract class AuthStates {}

class AuthInitState extends AuthStates {}

class ChangeSecure extends AuthStates {}

class AuthSuccessState extends AuthStates {}

class AuthLodingState extends AuthStates {}

class AuthFailureState extends AuthStates {}

class CodeConfirmationState extends AuthStates {}

class AuthInfoVerifySuccess extends AuthStates {}

class AuthInfoVerifyFailure extends AuthStates {}
