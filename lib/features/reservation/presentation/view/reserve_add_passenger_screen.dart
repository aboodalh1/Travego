import 'package:flutter/material.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import 'package:travego/features/reservation/presentation/view/passenger/addiotionalPassengerCardReserve.dart';
import 'package:travego/features/reservation/presentation/view/passenger/passenger_passport_reserve.dart';
import 'package:travego/features/reservation/presentation/view/passenger/passenger_visa_reserve.dart';

class AdditionalPersonnesScreens extends StatelessWidget {
  const AdditionalPersonnesScreens({super.key,
    required this.index,
    required this.reserveTripCubit
  });

  final ReserveTripCubit reserveTripCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
            body: index == 0
                ? AdditionalPassengerReserveCard(
              reserveTripCubit: reserveTripCubit,

            )
                : index == 1
                ? AddPassportWidget(
                reserveTripCubit: reserveTripCubit)
                : PassengerVisaReserve(
                reserveTripCubit: reserveTripCubit));
      }

}
