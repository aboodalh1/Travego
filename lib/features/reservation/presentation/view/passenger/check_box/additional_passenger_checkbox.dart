
import 'package:flutter/material.dart';

import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../../../core/utils/shared/constant.dart';
import '../../../manger/reserve_trip_cubit.dart';
import '../passenger_check_tile.dart';

class AdditionalPassengersCheckboxes extends StatelessWidget {
  const AdditionalPassengersCheckboxes({
    super.key,
    required this.reserveTripCubit,
  });

  final ReserveTripCubit reserveTripCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSizeUtil.screenHeight *
          personnes.length *
          0.1,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return AddedPassengerCheckTile(
                reserveTripCubit: reserveTripCubit, index: index);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.grey,
            );
          },
          itemCount: personnes.length),
    );
  }
}
