import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo_impl.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';

class PassengerPassportScreen extends StatelessWidget {
  const PassengerPassportScreen({super.key});

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
                title: Text('Gg passport'),
                content: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Passport first name',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.passportFirstName,
                          fill: false,
                          hintText: 'Passport first name',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Passport last name',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.passportLastName,
                          fill: false,
                          hintText: 'Passport last name',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Passport number',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.passportNumber,
                          fill: false,
                          hintText: 'Passport number',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Passport issue date',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.passportIssueDate,
                          fill: false,
                          hintText: 'Passport issue date',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Passport expired date',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.passportExpiredDate,
                          fill: false,
                          hintText: 'Passport expire date',
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
