import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/features/home/home_cubit/home_states.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/features/Settings/views/settings_screen.dart';
import 'package:travego/features/home/home_page.dart';
import 'package:travego/features/location/manger/location_cubit.dart';
import 'package:travego/features/location/views/location_screen.dart';

import '../../hotels/hotels/hotels_screen.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitState());
  static GeneralCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    HomeScreen(),
    LocationScreen(),
    HotelsScreen(),
    const SettingsScreen()
  ];
  int navBarSelectedItem = 0;
  void changeBottomNavBar(int selected, context) {
    if (navBarSelectedItem == 1) {
      BlocProvider.of<LocationCubit>(context).close();
    }
    navBarSelectedItem = selected;
    emit(ChangeBottomNavBar());
  }

}
