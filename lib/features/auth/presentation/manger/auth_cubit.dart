import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/auth/presentation/views/login_screen.dart';
import 'package:travego/features/layout.dart';
import 'package:travego/features/auth/repo/auth_repo.dart';
import 'package:travego/model/remote/client/user_account_model/user_account_model.dart';
import 'package:travego/model/user_model.dart';
import '../../../../core/utils/network/local/cacheHelper.dart';
import '../../../../core/utils/shared/constant.dart';
import '../views/verification_page.dart';

part 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitState());
  final AuthRepo authRepo;
  UserModel userModel= UserModel(message: 'message', status: 'status', localDateTime: 'localDateTime', body: UserBody(user:User(id: 0, firstName: '', lastName: '', theusername: '', email: '', creationDate: '', phoneNumber: ''),token:''));
  String code = '';
  bool onEditing = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final StreamController<bool> _pasteCode = StreamController<bool>.broadcast();
  Stream<bool> get pasteCode => _pasteCode.stream;
  Sink<bool> get pasteCodeSink => _pasteCode;

  bool registerIsSecure = true;
  bool loginIsSecure = true;
  Icon registerSecureIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.white,
  );
  Icon loginSecureIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.grey,
  );

  void registerChangeSecure() {
    registerIsSecure = !registerIsSecure;
    registerSecureIcon = const Icon(
      Icons.remove_red_eye_outlined,
      color: Colors.white,
    );
    emit(ChangeSecure());
  }

  void loginChangeSecure() {
    loginIsSecure = !loginIsSecure;
    loginSecureIcon = loginIsSecure
        ? const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.grey,
          )
        : const Icon(
            Icons.visibility_off_outlined,
            color: Colors.grey,
          );
    emit(ChangeSecure());
  }

  Future<void> register(
      {required String firstName,
      required String lastName,
      required String username,
      required String phone,
      required String email,
      required String password,
      required String confirmPassword,
      context}) async {
    emit(AuthLoadingState());
    var result = await authRepo.register(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword);
    result.fold((failure) {
      emit(AuthFailureState(failure.errMessage));
    }, (userModel) {
      emit(AuthSuccessState());
      navigateAndFinish(context, const VerificationScreen());
    });
  }

  Future<void> login({
    required String email,
    required String password,
    context,
  }) async {
    emit(AuthLoadingState());
    var result = await authRepo.login(email: email, password: password);
    result.fold((failure) {
      emit(AuthFailureState(failure.errMessage));
    }, (model) {
      userModel = UserModel.fromJson(model.data);
      globalUserModel = UserModel.fromJson(model.data);
      token = userModel.body.token;
       CacheHelper.saveData(key: 'token', value: userModel.body.token);
      emit(AuthSuccessState());
      loginPasswordController.clear();
      navigateAndFinish(context, const LayoutScreen());
    });
  }

  Future<void> verifyCode(
      {required String code, required String email, context}) async {
    emit(CodeVerificationLoadingState());
    var result = await authRepo.verificationCode(code: code, email: email);
    result.fold((failure) {
      emit(CodeVerifyFailure(failure.errMessage));
    }, (model) {
      userModel = UserModel.fromJson(model.data);
      token = userModel.body!.token!;
      CacheHelper.saveData(key: 'token', value: userModel.body!.token);
      emit(CodeVerifySuccess(message: userModel.message));
      navigateAndFinish(context, const LayoutScreen());
    });
  }

  Future<void> regenerateCode({required String email}) async {
    emit(CodeVerificationLoadingState());
    var result = await authRepo.regenerateVerificationCode(email: email);
    result.fold((failure) {
      emit(CodeVerifyFailure(failure.errMessage));
    }, (message1) {
      emit(CodeVerifySuccess(message:message1));
    });
  }

  Icon acceptPasswordIcon =  const Icon(
    CupertinoIcons.xmark_circle,
    color: Colors.white,
  );
  Icon acceptConfPasswordIcon =  const Icon(
    CupertinoIcons.xmark_circle,
    color: Colors.white,
  );
 bool isAuthCorrect =  false;
  void checkPassword(bool isAuthCorrect) {
    if (isAuthCorrect) {
      emit(AuthInfoVerifySuccess());
      acceptPasswordIcon =
          const Icon(CupertinoIcons.check_mark_circled, color: Colors.greenAccent,);
    } else {
      emit(AuthInfoVerifyFailure());
      acceptPasswordIcon =  const Icon(
        CupertinoIcons.xmark_circle,
        color: Colors.white,
      );
    }
  }
  bool isPasswordsMatch =  false;
  void checkMatchPassword(bool isPasswordsMatch) {
    if (isPasswordsMatch) {
      emit(AuthInfoVerifySuccess());
      acceptConfPasswordIcon =
          const Icon(CupertinoIcons.check_mark_circled, color: Colors.greenAccent);
    } else {
      emit(AuthInfoVerifyFailure());
      acceptConfPasswordIcon = const Icon(
        CupertinoIcons.xmark_circle,
        color: Colors.white,
      );
    }
  }

  void logout(context) {
    token = '';
    CacheHelper.removeData(key: 'token');
    navigateAndFinish(context, const LoginScreen());
  }
}
