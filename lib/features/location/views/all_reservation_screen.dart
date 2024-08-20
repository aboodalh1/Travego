import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/alert_dialog/loading_alert_dialog.dart';
import 'package:travego/features/home/presentation/manger/trips_cubit/trips_cubit.dart';
import 'package:travego/features/home/repo/trips_repo/trips_repo_impl.dart';
import 'package:travego/features/location/views/payment_screen.dart';

import '../../../core/utils/shared/constant.dart';

class AllReservationScreen extends StatelessWidget {
  const AllReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit(getIt.get<TripsRepoImpl>())
        ..getAllReservation(token: token),
      child: BlocConsumer<TripsCubit, TripsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetAllReservasionLoading) {
            print(token);
            return LoadingAlertDialog();
          }
          TripsCubit tripsCubit = BlocProvider.of<TripsCubit>(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              navigateTo(context,  PaymentScreen( reservationId: tripsCubit.allReservationModel.body[index].TripReservationId,));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              padding: const EdgeInsets.all(15.0),
                              width: double.infinity,
                              decoration:
                                  BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade200),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Trip name: ${tripsCubit.allReservationModel
                                          .body[index].TripName}",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black87),),
                                      const Spacer(),
                                      Text(
                                          '${tripsCubit.allReservationModel.body[index].confirmationId}'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        tripsCubit.allReservationModel.body[index]
                                            .confirmationStatus,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: Colors.black45),
                                      ),
                                      const Spacer(),
                                      Text(tripsCubit.allReservationModel
                                          .body[index].Description),
                                    ],
                                  ),
                                  Text(tripsCubit
                                      .allReservationModel.body[index].userEmail),
                                  Text(
                                      '${tripsCubit.allReservationModel.body[index].TripReservationId}'),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: tripsCubit.allReservationModel.body.length),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
