import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travego/features/auth/manger/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/presentation/auth_manger/auth_repo.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitState());
  final AuthRepo authRepo;

  // static AuthCubit get(context) => BlocProvider.of(context);
  bool registerIsSecure = true;
  bool loginIsSecure = true;
  late Icon registerSecureIcon = registerIsSecure
      ? const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.white,
  )
      : const Icon(
    Icons.visibility_off_outlined,
    color: Colors.white,
  );
  late Icon loginSecureIcon = loginIsSecure
      ? const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.white,
  )
      : const Icon(
    Icons.visibility_off_outlined,
    color: Colors.white,
  );

  String code = '';
  bool onEditing = false;

  void registerChangeSecure() {
    registerIsSecure = !registerIsSecure;
    emit(ChangeSecure());
  }

  void loginChangeSecure() {
    loginIsSecure = !loginIsSecure;
    emit(ChangeSecure());
  }

  Future<void> login({
    required String username,
    required String password,
    context,
  }) async {
    emit(AuthLodingState());

  }

  Future<void> register({required String firstName,
    required String lastName,
    required String username,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    context}) async {
    emit(AuthLodingState());
    var result = await authRepo.register(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword);
    result.fold((failure){
      emit(AuthFailureState(failure.errMessage));
    },(userModel)
    {
      emit(AuthSuccessState());
    });
  }

  Future<void> verifyCode(
      {required String code, required String userId, context}) async {
    emit(AuthLodingState());


  }

  IconData authInfoIconData = CupertinoIcons.check_mark_circled;

  void verifyAuthInfo(bool isAuthCorrect) {
    if (isAuthCorrect) {
      emit(AuthInfoVerifySuccess());
      authInfoIconData = CupertinoIcons.check_mark_circled;
    } else {
      emit(AuthInfoVerifyFailure());
      authInfoIconData = CupertinoIcons.xmark_circle;
    }
  }
}
