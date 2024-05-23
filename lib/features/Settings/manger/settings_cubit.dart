import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/utils/shared/constant.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

    TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passwordConfrimController = TextEditingController();


  bool isEditProfile = false;
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
    isEditProfile = !isEditProfile;
    emit(EditInformationState());
  }

  String selectedValue = 'On';
  void selectOn(context) async{
    selectedValue= 'On';
    await context.setLocale(const Locale('en'));
    isLTR = false;
  }

  void selectOff(context) async{
    selectedValue= 'Off';
    await context.setLocale(const Locale('ar'));
    isLTR = true;
  }
}
