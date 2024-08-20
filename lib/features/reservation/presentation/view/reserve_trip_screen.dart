import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:travego/core/widgets/reservation/add_passenger_card/add_reservation_passenger_card.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import 'package:travego/features/reservation/presentation/view/passenger/check_box/additional_passenger_checkbox.dart';
import 'package:travego/features/reservation/presentation/view/passenger/check_box/passenger_check_box.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo_impl.dart';

import '../../../../core/utils/shared/constant.dart';

class ReserveTripScreen extends StatelessWidget {
  const ReserveTripScreen({super.key,required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ReserveTripCubit(getIt.get<ReserveTripRepoImpl>())
        ..getAllPassengers(token: token)..getMyDetails(token: token),
      child: BlocConsumer<ReserveTripCubit, ReserveTripState>(
        listener: (context,state){
          if(state is GetPassengerLoading ||state is GetMyDetailsLoading){
            customSnackBar(context, 'Loading...');
          }
          if(state is GetPassengerErrorState ){
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if(state is GetMyDetailsStateFailure ){
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if(state is ReserveTripSubmitSuccess){
            showToast(text: 'State successfully', state: ToastStates.SUCCESS);
          }
          if(state is ReserveTripSubmitFailure){
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          ReserveTripCubit reserveTripCubit = BlocProvider.of<ReserveTripCubit>(
              context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCheckBox(reserveTripCubit: reserveTripCubit),
                    PassengersCheckBoxes(reserveTripCubit: reserveTripCubit),
                    const Gap(10),
                    Text(
                      "Added Passenger: ",
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,
                    ),
                    AdditionalPassengersCheckboxes(
                        reserveTripCubit: reserveTripCubit),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(15),
                      child: DefaultElevated(
                          label: "Add Passenger",
                          fill: false,
                          onPressed: () {
                            navigateTo(
                                context,
                                AddPassengerCardToReserve(
                                  reserveTripCubit: reserveTripCubit,
                                ));
                            print(personnes);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(15),
                      child: DefaultElevated(
                          label: "Submit",
                          fill: false,
                          onPressed: () {
                            reserveTripCubit.reserveTrip(token: token,
                                passengers: reservationPersonnes,
                                tripId: tripId);
                          }),
                    )
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

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({
    super.key,
    required this.reserveTripCubit,
  });

  final ReserveTripCubit reserveTripCubit;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (value) {
        if (value == true) {
          reserveTripCubit.getMyDetails(token: token);
          print(reservationPersonnes);
        } else {
          reserveTripCubit.removePassengerFromReserve(reserveTripCubit.myDetailsModel!.body.firstname);
          print(reservationPersonnes);
        }
        reserveTripCubit.changeMyCheckValue();
      },
      value: reserveTripCubit.checkMyValue,
      title: Text(
        'Me',
        style: Theme
            .of(context)
            .textTheme
            .headlineLarge,
      ),
    );
  }
}
