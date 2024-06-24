import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../repo/passengers_repo/passengers_repo_impl.dart';

class PassengerPersonalIdScreen extends StatelessWidget {
  const PassengerPersonalIdScreen({super.key});

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
                title: Text('Gg Personal id'),
                content: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Id first name',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.idFirstName,
                          fill: false,
                          hintText: 'id first name',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Id last name',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.idLastName,
                          fill: false,
                          hintText: 'id last name',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Id birthday',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.idBirthDate,
                          fill: false,
                          hintText: 'id birthday',
                          secure: false),
                      Gap(15),
                      const Text(
                        'Id nationality',
                      ),
                      const Gap(5),
                      defaultCircleTextField(
                          controller: passengerCubit.idNationality,
                          fill: false,
                          hintText: 'nationality',
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
