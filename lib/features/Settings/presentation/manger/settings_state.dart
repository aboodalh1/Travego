part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SwitchContainerState extends SettingsState {}

class EditInformationSuccessState extends SettingsState {
  final User user;
  final String message;

  EditInformationSuccessState({required this.message, required this.user});
}

class EditInformationFailureState extends SettingsState {
  final String error;

  EditInformationFailureState({required this.error});
}

class EditLoading extends SettingsState {}

class ChangePasswordSuccessState extends SettingsState {
  final String message;

  ChangePasswordSuccessState({required this.message});
}

class ChangeThemeState extends SettingsState {}

class ChangeNotificationState extends SettingsState {}

class ChangeLanguageState extends SettingsState {}

class ChangeNavBar extends SettingsState {}

class AddInfoError extends SettingsState {
  final String error;

  AddInfoError({required this.error});
}

class AddInfoLoading extends SettingsState {}

class AddInfoSuccess extends SettingsState {
  final String message;

  AddInfoSuccess({required this.message});
}

class GetUserInfoLoading extends SettingsState {}

class GetInfoError extends SettingsState {
  final String error;

  GetInfoError({required this.error});
}

class GetUserInfoError extends SettingsState {
  final String error;

  GetUserInfoError({required this.error});
}

class GetInfoLoading extends SettingsState {}

class GetInfoSuccess extends SettingsState {}

class DeleteAccountLoadingState extends SettingsState {}

class DeleteAccountSuccess extends SettingsState {}

class DeleteAccountErrorState extends SettingsState {
  final String error;

  DeleteAccountErrorState({required this.error});
}
