import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/cubits/general_cubit/gen_cubit.dart';
import 'package:travego/core/cubits/general_cubit/gen_states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralCubit cubit = GeneralCubit.get(context);
    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
        BlocProvider.of<GeneralCubit>(context).changeBottomNavBar(value);
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'.tr),
        BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Explore'.tr),
        BottomNavigationBarItem(
            icon: Icon(Icons.home_work_outlined), label: 'hotels'.tr),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'.tr)
      ],
    );
  }
}
