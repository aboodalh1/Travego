import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/cubits/general_cubit/gen_states.dart';
import 'package:travego/view/navigation_bar_items/Settings/settings_screen.dart';
import 'package:travego/view/navigation_bar_items/favorite/favorite_screen.dart';
import 'package:travego/view/navigation_bar_items/home/home_page.dart';
import 'package:travego/view/navigation_bar_items/location/location_screen.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitState());
  static GeneralCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    HomeScreen(),
    LocationScreen(),
    FavoriteScreen(),
    SettingsScreen()
  ];
  int navBarSelectedItem = 0;
  void changeBottomNavBar(int selected) {
    navBarSelectedItem = selected;
    emit(ChangeBottomNavBar());
  }
}
