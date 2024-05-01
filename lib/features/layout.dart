import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/home/home_cubit/home_cubit.dart';
import 'package:travego/features/home/home_cubit/home_states.dart';

import 'create_trip/create_trip.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralCubit cubit = GeneralCubit.get(context);
    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              navigateTo(context, CreateTrip());
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            backgroundColor: defaultColor,
            elevation: 0,
          ),
          bottomNavigationBar: customBottomNavBar(context),
          body: cubit.screens[cubit.navBarSelectedItem],
        );
      },
    );
  }

  BottomNavigationBar customBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: BlocProvider.of<GeneralCubit>(context).navBarSelectedItem,
      onTap: (value) {
        BlocProvider.of<GeneralCubit>(context)
            .changeBottomNavBar(value, context);
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'.tr),
        BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Explore'.tr),
        BottomNavigationBarItem(
            icon: Icon(Icons.home_work_outlined), label: 'hotels'.tr),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Settings'.tr)
      ],
    );
  }
}
