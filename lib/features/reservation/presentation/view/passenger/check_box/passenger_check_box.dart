
import 'package:flutter/material.dart';

import '../../../../../../core/utils/screen_size_util.dart';
import '../../../manger/reserve_trip_cubit.dart';
import '../passenger_check_tile.dart';

class PassengersCheckBoxes extends StatelessWidget {
  const PassengersCheckBoxes({
    super.key,
    required this.reserveTripCubit,
  });

  final ReserveTripCubit reserveTripCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSizeUtil.screenHeight *
          reserveTripCubit.passengerInfoModel.body.length *
          0.08,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return PassengerCheckTile(
              reserveTripCubit: reserveTripCubit,
              index: index,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black54,
            );
          },
          itemCount:
          reserveTripCubit.passengerInfoModel.body.length),
    );
  }
}
