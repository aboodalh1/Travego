import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../boxes.dart';
import '../../../../core/utils/shared/constant.dart';
import '../../../../model/local/user_local_model.dart';


part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  // User user = boxUser.get('userBox');
    TextEditingController lastNameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();


  bool isEditProfile = false;
  bool isEditPassword = true;
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
  void backToSettings(){
    isEditProfile = false;
    isEditPassword = false;
    emit(EditInformationState());
  }
  void editPassword() {
    isEditPassword = !isEditPassword;
    isEditProfile = false;
    emit(EditPasswordState());
  }

  String selectedValue = 'On';
  void selectOn(context) async{
    selectedValue= 'On';
    await context.setLocale(const Locale('en'));
    isLTR = false;
    emit(ChangeLanguageState());
  }

  void selectOff(context) async{
    selectedValue= 'Off';
    await context.setLocale(const Locale('ar'));
    isLTR = true;
    emit(ChangeLanguageState());
  }
  bool isEdit = false;
  Icon editIcon =  const Icon(Icons.edit);
  void editField(){
    isEdit = !isEdit;
     editIcon = isEdit? const Icon(Icons.check): const Icon(Icons.edit);
    emit(EditInformationState());
  }
}
