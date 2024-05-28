part of 'settings_cubit.dart';
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class GetInformationDetails extends SettingsState {}

class EditInformationState extends SettingsState {}

class EditInformationSuccessState extends SettingsState {}

class EditInformationFailureState extends SettingsState {}

class ChangeThemeState extends SettingsState{}

class ChangeNotificationState extends SettingsState{}

class ChangeLanguageState extends SettingsState{}

class EditPasswordState extends SettingsState{}