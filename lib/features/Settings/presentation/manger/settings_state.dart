part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SwitchContainerState extends SettingsState {}

class EditInformationSuccessState extends SettingsState {
  final User user;
  final String message;
  EditInformationSuccessState({required this.message,required this.user});
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
