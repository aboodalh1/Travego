import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/hotels/presentation/manger/hotel_cubit.dart';
import 'package:travego/features/location/manger/location_cubit.dart';
import 'package:travego/features/location/views/location_screen.dart';

import '../Settings/presentation/views/settings_screen.dart';
import '../home/presentation/view/home_page.dart';
import '../hotels/presentation/views/hotels_screen/hotels_screen.dart';


part 'layout_states.dart';
class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitState());

  List<Widget> screens = [
    const HomeScreen(),
    LocationScreen(),
    const HotelsScreen(),
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
