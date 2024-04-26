import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travego/features/auth/manger/auth_states.dart';
import 'package:travego/features/auth/views/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/auth/views/verification_page.dart';

import '../../../core/utils/network/remote/dio_helper.dart';
import '../../../core/utils/shared/components/components.dart';

class AuthCubit extends Cubit<AuthStates> {
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  AuthCubit() : super(AuthInitState());
  // static AuthCubit get(context) => BlocProvider.of(context);
  bool isSecure = true;
  late Icon secureIcon = isSecure
      ? const Icon(Icons.remove_red_eye_outlined)
      : const Icon(Icons.visibility_off_outlined);
  String code = '';
  bool onEditing = false;

  void changeSecure() {
    isSecure = !isSecure;
    emit(ChangeSecure());
  }

  Future<void> login({
    required String username,
    required String password,
    context,
  }) async {
    emit(AuthLodingState());
    DioHelper().postDataWithAuth(
        url: 'url', data: {"": username, "": password}).then((value) {
      ///code....
      emit(AuthSuccessState());
      navigateAndFinish(context, LoginScreen());
    }).catchError((e) {
      emit(AuthFailureState());
    });
  }

  Future<void> register(
      {required String username,
      required String email,
      required String password,
      required String passwordConfirmation,
      context}) async {
    emit(AuthLodingState());
    DioHelper().postDataWithAuth(url: 'BaseUser/Register', data: {
      "name": "abdallah",
      "email": "abdallahalharisy@gmail.com",
      "password": "password",
    }).then((value) {
      ///code....
      //
      print(value.data);
      emit(AuthSuccessState());
      navigateAndFinish(context, VerificationScreen());
    }).catchError((e) {
      emit(AuthFailureState());
      print('gg');
      print(e.toString());
    });
  }

  Future<void> verifyCode(
      {required String code, required String userId, context}) async {
    emit(AuthLodingState());
    DioHelper().postDataWithAuth(url: 'BaseUser/send_Confirmation_Code', data: {
      "codeNumber": code,
      "user_Id": userId,
    }).then((value) {
      print(value.data);
      emit(AuthSuccessState());
      navigateAndFinish(context, LoginScreen());
    }).catchError((e) {
      emit(AuthFailureState());
      print('gg');
      print(e.toString());
    });
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
