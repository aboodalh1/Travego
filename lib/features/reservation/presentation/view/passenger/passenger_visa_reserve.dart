import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo_impl.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';

class PassengerVisaReserve extends StatelessWidget {
  const PassengerVisaReserve({super.key,required this.reserveTripCubit});
  final ReserveTripCubit reserveTripCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveTripCubit(getIt.get<ReserveTripRepoImpl>()),
      child: BlocBuilder<ReserveTripCubit, ReserveTripState>(
        builder: (context, state) {

          return EditVisaWidget(reserveCubit: reserveTripCubit);
        },
      ),
    );
  }
}

class EditVisaWidget extends StatelessWidget {
  const EditVisaWidget({
    super.key,
    required this.reserveCubit,
  });

  final ReserveTripCubit reserveCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          title:  Row(
            children: [
              Text(' Visa'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: (){
                },
              )
            ],
          ),
          content: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Visa type',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: reserveCubit.visaTypeController,
                    fill: false,
                    hintText: 'visa type',
                    secure: false),
                const Gap(15),
                const Text(
                  'Visa country',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: reserveCubit.visaCountryController,
                    fill: false,
                    hintText: 'country',
                    secure: false),
                const Gap(15),
                const Text(
                  'Visa issue date',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: reserveCubit.visaIssueDateController,
                    fill: false,
                    hintText: 'visa issue date',
                    secure: false),
                const Gap(15),
                const Text(
                  'Visa expired date',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: reserveCubit.visaExpiresDateController,
                    fill: false,
                    hintText: 'visa expired date',
                    secure: false),
                const Gap(15),

                DefaultElevated(label: 'save', fill: true, onPressed:(){
                  })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
