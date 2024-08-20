import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import 'package:travego/features/reservation/presentation/view/reserve_add_passenger_screen.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo_impl.dart';

import '../../../../../core/utils/shared/components/components.dart';

class AddPassengerCardToReserve extends StatelessWidget {
  const AddPassengerCardToReserve({
    super.key,
    required this.reserveTripCubit
  });

  final ReserveTripCubit reserveTripCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveTripCubit(getIt.get<ReserveTripRepoImpl>()),
      child: BlocConsumer<ReserveTripCubit, ReserveTripState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ReserveTripCubit reserveTripCubit=BlocProvider.of<ReserveTripCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add passenger"),
            ),
            body: Form(
              key: reserveTripCubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                          onPageChanged: (int index) {
                            reserveTripCubit.lastPage(index);
                          },
                          controller: reserveTripCubit.pageController,
                          itemCount: 3,
                          itemBuilder: (context, index) =>
                              AdditionalPersonnesScreens(
                                reserveTripCubit: reserveTripCubit,
                                index: index,
                              )),
                    ),
                    Row(
                      children: [
                        DefaultElevated(
                            label: 'Back',
                            fill: false,
                            onPressed: () {
                              reserveTripCubit.pageController.previousPage(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  curve: Curves.easeInOutCirc);
                            }),
                        const Spacer(),
                        DefaultElevated(
                            label: reserveTripCubit.isLast
                                ? 'Add Passenger'
                                : 'Next',
                            fill: false,
                            onPressed: () {
                              if (reserveTripCubit.formKey.currentState!
                                  .validate()) {
                                reserveTripCubit.isLast ? reserveTripCubit
                                    .addPersonnes() :
                                reserveTripCubit.pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 500,
                                    ),
                                    curve: Curves.easeInOutCubic);
                              } else {
                                showToast(
                                    text: 'All field are required ',
                                    state: ToastStates.WARNING);
                              }
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
