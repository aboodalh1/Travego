import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/Settings/presentation/views/user_details/additional_info/my_passport_screen.dart';
import 'package:travego/features/Settings/presentation/views/user_details/additional_info/my_personal_id_screen.dart';
import 'package:travego/features/Settings/presentation/views/user_details/additional_info/my_visa_screen.dart';
import 'package:travego/features/Settings/repo/settings_repo.dart';
import 'package:travego/features/auth/presentation/views/login_screen.dart';
import 'package:travego/model/remote/client/my_passport_model.dart';
import 'package:travego/model/remote/client/my_personal_id_model.dart';
import 'package:travego/model/remote/client/my_visa_model.dart';
import 'package:travego/model/remote/client/user_account_model/user_account_model.dart';

import '../../../../core/utils/shared/constant.dart';
import '../../../../model/user_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());
  final SettingsRepo settingsRepo;
  MyPassportModel ?myPassportModel;
  MyVisaModel ?myVisaModel;
  UserAccountModel ? userAccountModel;
  MyPersonalIdModel? myPersonalIdModel;
  bool isFound = true;

  TextEditingController deleteAccountPassword = TextEditingController();
  TextEditingController deleteWalletPassword = TextEditingController();

  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  final TextEditingController passportFirstName = TextEditingController();
  final TextEditingController passportLastName = TextEditingController();
  final TextEditingController passportIssueDate = TextEditingController();
  final TextEditingController passportExpiredDate = TextEditingController();
  final TextEditingController passportNumber = TextEditingController();

  final TextEditingController visaType = TextEditingController();
  final TextEditingController visaCountry = TextEditingController();
  final TextEditingController visaIssueDate = TextEditingController();
  final TextEditingController visaExpiredDate = TextEditingController();

  final TextEditingController idFirstName = TextEditingController();
  final TextEditingController idLastName = TextEditingController();
  final TextEditingController idBirthDate = TextEditingController();
  final TextEditingController idNationality = TextEditingController();

  List<Widget> screens = [
    const MyPassportScreen(),
    const MyVisaScreen(),
    const MyPersonalIdScreen()
  ];
  int navBarSelectedItem = 0;

  void changeBottomNavBar(int selected, context) {
    navBarSelectedItem = selected;
    emit(ChangeNavBar());
  }
  bool addNew = false;
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
    firstNameController.text = globalUserModel!.body!.user!.firstName!;
    lastNameController.text = globalUserModel!.body!.user!.lastName!;
    phoneController.text = globalUserModel!.body!.user!.phoneNumber!;
    emailController.text = globalUserModel!.body!.user!.email!;
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
    try {
      await context.setLocale(const Locale('en'));
    }catch(e){
      //ff
    }
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

  Future<void> changePassword({required String currentPassword,
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
      firstNameController.text = globalUserModel!.body!.user!.firstName!;
      lastNameController.text = globalUserModel!.body!.user!.lastName!;
      phoneController.text = globalUserModel!.body!.user!.phoneNumber!;
      emailController.text = globalUserModel!.body!.user!.email!;
      emit(ChangePasswordSuccessState(message: message));
    });
  }

  Future<void> changeInformation({required String token,
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
          message: data, user: globalUserModel!.body!.user!));
    });
  }

  Future<void> addMyPassport({
    required String passportFirstName,
    required String passportLastName,
    required String passportNumber,
    required String issueDate,
    required String token,
    required String expiredDate,
  }) async {
    emit(AddInfoLoading());
    var result = await settingsRepo.addMyPassport(
        passportFirstName: passportFirstName,
        passportLastName: passportLastName,
        passportNumber: passportNumber,
        issueDate: issueDate,
        expiredDate: expiredDate,
        token: token);
    result.fold((failure) {
      emit(AddInfoError(error: failure.errMessage));
    }, (message) {
      emit(AddInfoSuccess(message:message ));
      passportIssueDate.clear();
      this.passportFirstName.clear();
      this.passportLastName.clear();
      this.passportNumber.clear();
      passportIssueDate.clear();
      getMyPassport(token: token);
    });
  }

  Future<void> addMyPersonalId({
    required String idfirstName,
    required String idlastName,
    required String idBirthDate,
    required String nationality,
    required String token,
  }) async {
    emit(AddInfoLoading());
    var result = await settingsRepo.addMyPersonalId(idfirstName: idfirstName,
        idlastName: idlastName,
        idBirthDate: idBirthDate,
        nationality: nationality,
        token: token);
    result.fold((failure) {
      emit(AddInfoError(error: failure.errMessage));
    }, (message) {
      emit(AddInfoSuccess(message: message));
      idFirstName.clear();
      idNationality.clear();
      idLastName.clear();
      this.idBirthDate.clear();
      getMyPersonalId(token: token);
    });
  }

  Future<void> addMyVisa({
    required String visaType,
    required String country,
    required String issueDate,
    required String expiredDate,
    required String token,
  }) async {
    emit(AddInfoLoading());
    var result =await settingsRepo.addMyVisa(visaType: visaType,
        country: country,
        issueDate: issueDate,
        expiredDate: expiredDate,
        token: token);
    result.fold((failure) {
      emit(AddInfoError(error: failure.errMessage));
    }, (message) {
      emit(AddInfoSuccess(message:message));
      this.visaType.clear();
      visaCountry.clear();
      visaExpiredDate.clear();
      visaIssueDate.clear();
      getMyVisa(token: token);
    });
  }

  Future<void> getMyPassport({required String token}) async {
    emit(GetInfoLoading());
    var result = await settingsRepo.getMyPassport(token: token);
    result.fold((failure) {

      emit(GetInfoError(error: failure.errMessage));
    }, (r) {

      myPassportModel = MyPassportModel.fromJson(r.data);

      passportFirstName.text=myPassportModel!.body!.firstName!;
      passportLastName.text=myPassportModel!.body!.lastName!;
      passportNumber.text=myPassportModel!.body!.passportNumber!;
      passportIssueDate.text=myPassportModel!.body!.issueDate!;
      passportExpiredDate.text = myPassportModel!.body!.expiryDate!;
      emit(GetInfoSuccess());
    });
  }

  Future<void> getMyPersonalId({required String token}) async {
    emit(GetInfoLoading());
    var result = await settingsRepo.getMyPersonalId(token: token);
    result.fold((failure) {
      emit(GetInfoError(error: failure.errMessage));
    }, (r) {
      myPersonalIdModel = MyPersonalIdModel.fromJson(r.data);

      idFirstName.text=myPersonalIdModel!.body!.firstName!;
      idLastName.text=myPersonalIdModel!.body!.lastName!;
      idNationality.text=myPersonalIdModel!.body!.nationality!;
      idBirthDate.text=myPersonalIdModel!.body!.birthDate!;

      emit(GetInfoSuccess());
    });
  }

  Future<void> getMyVisa({required String token}) async {
    emit(GetInfoLoading());
    var result = await settingsRepo.getMyVisa(token: token);


    result.fold((failure) {
      emit(GetInfoError(error: failure.errMessage));

    }, (r) {
      myVisaModel = MyVisaModel.fromJson(r.data);
      visaType.text=myVisaModel!.body!.visaType!;
      visaCountry.text=myVisaModel!.body!.country!;
      visaIssueDate.text=myVisaModel!.body!.issueDate!;
      visaExpiredDate.text=myVisaModel!.body!.expiryDate!;
      emit(GetInfoSuccess());
    });
  }




  Future<void> deleteMyPassport({required String token}) async {
    var result = await settingsRepo.deleteMyPassport(token: token);
    result.fold((failure) {
      emit(GetInfoError(error: failure.errMessage));
    }, (r) {
      emit(GetInfoSuccess());
      passportFirstName.text=myPassportModel!.body!.firstName!;
      passportLastName.text=myPassportModel!.body!.lastName!;
      passportNumber.text=myPassportModel!.body!.passportNumber!;
      passportIssueDate.text=myPassportModel!.body!.issueDate!;
      passportExpiredDate.text = myPassportModel!.body!.expiryDate!;
      getMyPassport(token: token);
    });
  }

  Future<void> deleteMyPersonalId({required String token}) async {
    var result = await settingsRepo.deleteMyPersonalId(token: token);
    result.fold((failure) {
      emit(GetInfoError(error: failure.errMessage));
    }, (r) {
      emit(GetInfoSuccess());
      idFirstName.clear();
      idNationality.clear();
      idLastName.clear();
      idBirthDate.clear();
      getMyPersonalId(token: token);
    });
  }

  Future<void> deleteMyVisa({required String token}) async {
    var result = await settingsRepo.deleteMyVisa(token: token);
    result.fold((failure) {
      emit(GetInfoError(error: failure.errMessage));
    }, (r) {
      emit(GetInfoSuccess());
      visaType.text=myVisaModel!.body!.visaType!;
      visaCountry.text=myVisaModel!.body!.country!;
      visaIssueDate.text=myVisaModel!.body!.issueDate!;
      visaExpiredDate.text=myVisaModel!.body!.expiryDate!;
      getMyVisa(token: token);
    });
  }

    Future<void> deleteMyAccount(context,{required String token}) async {
    emit(DeleteAccountLoadingState());
    var result = await settingsRepo.deleteMyAccount(token: token);
    result.fold((failure) {
      emit(DeleteAccountErrorState(error: failure.errMessage));
    }, (r) {
      emit(DeleteAccountSuccess());
      navigateAndFinish(context, const LoginScreen());
    });
  }


  Future<void> getMyAccount({required String token}) async {
    emit(GetUserInfoLoading());
    var result = await settingsRepo.getMyInfo(token: token);
    result.fold((failure) {
      emit(GetUserInfoError(error: failure.errMessage));
    }, (r) {
      userAccountModel = UserAccountModel.fromJson(r.data);
      emit(GetInfoSuccess());
    });
  }
}
