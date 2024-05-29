import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/features/Settings/repo/settings_repo.dart';

import '../../../../core/utils/shared/constant.dart';
import '../../../../model/user_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());
  final SettingsRepo settingsRepo;

  // User user = boxUser.get('userBox');
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();



  bool isEditProfile = false;
  bool isEditPassword = false;
  bool notificationSwitchValue = false;
  bool themeSwitchValue = isDark;

  void themeToggleSwitch() {
    isDark = !isDark;
    themeSwitchValue = !themeSwitchValue;
    if (themeSwitchValue == true) {
      Get.changeTheme(ThemeData.dark());
    }
    if (themeSwitchValue == false) {
      Get.changeTheme(ThemeData.light());
    }
    emit(ChangeThemeState());
  }

  void notificationToggleSwitch() {
    notificationSwitchValue = !notificationSwitchValue;

    emit(ChangeNotificationState());
  }

  void editProfile() {
    firstNameController.text = userModel!.body!.user!.firstName!;
    lastNameController.text = userModel!.body!.user!.lastName!;
    phoneController.text = userModel!.body!.user!.phoneNumber!;
    emailController.text = userModel!.body!.user!.email!;
    isEditProfile = !isEditProfile;
    emit(SwitchContainerState());
  }

  void backToSettings() {
    isEditProfile = false;
    isEditPassword = false;
    emit(SwitchContainerState());
  }

  void editPassword() {
    isEditPassword = !isEditPassword;
    isEditProfile = false;
    emit(SwitchContainerState());
  }

  String selectedValue = 'On';

  void selectOn(context) async {
    selectedValue = 'On';
    await context.setLocale(const Locale('en'));
    isLTR = false;
    emit(ChangeLanguageState());
  }

  void selectOff(context) async {
    selectedValue = 'Off';
    await context.setLocale(const Locale('ar'));
    isLTR = true;
    emit(ChangeLanguageState());
  }

  bool isEdit = false;
  Icon editIcon = const Icon(Icons.edit);

  void editField() {
    isEdit = !isEdit;
    editIcon = isEdit ? const Icon(Icons.check) : const Icon(Icons.edit);
    emit(SwitchContainerState());
  }

  Future<void> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmNewPassword,
      required String token}) async {
    var result = await settingsRepo.editPassword(
        token: token,
        oldPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmNewPassword);
    result.fold((failure) {
      emit(EditInformationFailureState(error: failure.errMessage));
    }, (message) {
      firstNameController.text = userModel!.body!.user!.firstName!;
      lastNameController.text = userModel!.body!.user!.lastName!;
      phoneController.text = userModel!.body!.user!.phoneNumber!;
      emailController.text = userModel!.body!.user!.email!;
      emit(ChangePasswordSuccessState(message: message));
    });
  }

  Future<void> changeInformation(
      {required String token,
      required String firstName,
      required String lastName,
      required String username,
      required String phone}) async {
    var result = await settingsRepo.editProfile(
        token: token,
        firstName: firstName,
        lastName: lastName,
        username: username,
        phone: phone);
    result.fold((failure) {
      emit(EditInformationFailureState(error: failure.errMessage));
    }, (data) {
      emit(EditInformationSuccessState(
          message: data, user: userModel!.body!.user!));
    });
  }
}
