import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/cubits/general_cubit/gen_states.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/features/Settings/views/settings_screen.dart';
import 'package:travego/view/navigation_bar_items/favorite/favorite_screen.dart';
import 'package:travego/view/navigation_bar_items/home/home_page.dart';
import 'package:travego/view/navigation_bar_items/location/location_cubit/location_cubit.dart';
import 'package:travego/view/navigation_bar_items/location/location_screen.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitState());

  bool notificationSwitchValue = false;
  bool themeSwitchValue = false;

  static GeneralCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    HomeScreen(),
    LocationScreen(),
    FavoriteScreen(),
    SettingsScreen()
  ];
  int navBarSelectedItem = 0;
  void changeBottomNavBar(int selected, context) {
    if (navBarSelectedItem == 1) {
      BlocProvider.of<LocationCubit>(context).close();
    }
    navBarSelectedItem = selected;
    emit(ChangeBottomNavBar());
  }

  void themeToggleSwitch() {
    themeSwitchValue = !themeSwitchValue;
    if (themeSwitchValue == true) {
      Get.changeTheme(ThemeData.dark());
    }
    if (themeSwitchValue == false) {
      Get.changeTheme(ThemeData.light());
    }
    isDark = !isDark;
    emit(ChangeThemeState());
  }

  void toggle() {
    emit(ChangeBottomNavBar());
  }

  void notificationToggleSwitch() {
    notificationSwitchValue = !notificationSwitchValue;
    if (notificationSwitchValue == true) {
      Get.changeTheme(ThemeData.dark());
    }
    if (notificationSwitchValue == false) {
      Get.changeTheme(ThemeData.light());
    }
    emit(ChangeThemeState());
  }
}
