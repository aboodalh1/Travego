import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../repo/passengers_repo/passengers_repo_impl.dart';

class PassengerVisaScreen extends StatelessWidget {
  const PassengerVisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengerCubit(getIt.get<PassengersRepoImpl>()),
      child: BlocConsumer<PassengerCubit, PassengerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          PassengerCubit passengerCubit =
          BlocProvider.of<PassengerCubit>(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                title: Text('Gg Visa'),
                content: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Visa type',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.visaType,
                          fill: false,
                          hintText: 'visa type',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Visa country',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.visaCountry,
                          fill: false,
                          hintText: 'country',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Visa issue date',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.visaIssueDate,
                          fill: false,
                          hintText: 'visa issue date',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Visa expired date',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.visaExpiredDate,
                          fill: false,
                          hintText: 'visa expired date',
                          secure: false),
                      Gap(15),

                      DefaultElevated(label: 'save', fill: true, onPressed:(){})
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
