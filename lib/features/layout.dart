import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:animations/animations.dart';
import '../core/widgets/custom_nav_bar/custom_nav_bar.dart';
import 'create_trip/create_trip.dart';
import 'general_cubit/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
   const LayoutScreen({super.key});

   final double _fabDimension = 56;


  final ContainerTransitionType _transitionType = ContainerTransitionType.fadeThrough;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {},
      builder: (context, state) {
        GeneralCubit cubit = BlocProvider.of<GeneralCubit>(context);
        return SafeArea(
          child: Scaffold(
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            floatingActionButton: OpenContainer(
                clipBehavior: Clip.none,
                transitionType: _transitionType,
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, openContainer) => const CreateTrip(),
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
                    child: const Center(
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


}










