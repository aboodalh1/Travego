import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/alert_dialog/loading_alert_dialog.dart';
import 'package:travego/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:travego/features/home/presentation/manger/trips_cubit/trips_cubit.dart';
import 'package:travego/features/home/repo/trips_repo/trips_repo_impl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/utils/shared/constant.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.reservationId});

  final int reservationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit(getIt.get<TripsRepoImpl>()),
      child: BlocConsumer<TripsCubit, TripsState>(
        listener: (context, state) {
          if (state is PaidSuccessfulState) {
            customSnackBar(context, state.message);
          }
          if (state is PaidFailureState) {
            customSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          TripsCubit tripsCubit = BlocProvider.of<TripsCubit>(context);
          if (state is PayingLoading) {
            return const Scaffold(body: LoadingAlertDialog());
          }

          return Scaffold(
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(108.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      DefaultElevated(
                          label: 'Wallet',
                          fill: true,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: const Text(
                                        "Are you sure you want to Checkout"),
                                    actions: [
                                      DefaultElevated(
                                          label: 'Yes',
                                          fill: true,
                                          onPressed: () {
                                            tripsCubit.payForReservation(
                                                token: token,
                                                id: reservationId);
                                            Navigator.pop(context);
                                          }),
                                      DefaultElevated(
                                          label: 'No',
                                          fill: false,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })
                                    ],
                                  );
                                });
                          }),
                      const Spacer(),
                      DefaultElevated(
                          label: 'Paypal',
                          fill: false,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: const Text(
                                        "Are you sure you want to Checkout"),
                                    actions: [
                                      DefaultElevated(
                                          label: 'Yes',
                                          fill: true,
                                          onPressed: () async {
                                            var url =
                                                'https://travego-z86d.onrender.com/api/home';
                                            if (await canLaunchUrlString(url)) {
                                              await launchUrlString(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                            Navigator.pop(context);
                                          }),
                                      DefaultElevated(
                                          label: 'No',
                                          fill: false,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })
                                    ],
                                  );
                                });
                          }),
                    ],
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
