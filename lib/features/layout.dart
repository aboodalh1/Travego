import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:animations/animations.dart';
import 'create_trip/create_trip.dart';
import 'home/general_cubit/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
   const LayoutScreen({super.key});

   final double _fabDimension = 56;


  final ContainerTransitionType _transitionType = ContainerTransitionType.fadeThrough;

  @override
  Widget build(BuildContext context) {
    GeneralCubit cubit = GeneralCubit.get(context);
    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            floatingActionButton: OpenContainer(
                clipBehavior: Clip.none,
                transitionType: _transitionType,
                transitionDuration: Duration(milliseconds: 500),
                openBuilder: (context, openContainer) => CreateTrip(),
                closedElevation: 6,
                closedShape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(_fabDimension / 2),
                  ),
                ),
                closedColor: defaultColor,
                closedBuilder: (context, openContainer) {
                  return SizedBox(
                    height: _fabDimension,
                    width: _fabDimension,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
          
            bottomNavigationBar: customBottomNavBar(context),
            body: PageTransitionSwitcher(
                transitionBuilder: (Widget child,
                    Animation<double> primaryAnimation,
                    Animation<double> secondaryAnimation) {
                  return FadeThroughTransition(animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,);
                },
                child: cubit.screens[cubit.navBarSelectedItem]),
          ),
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










