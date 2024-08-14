import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo_impl.dart';
import '../../../../../core/utils/network/remote/service_locator.dart';

class PassengerPassportReserve extends StatelessWidget {
  const PassengerPassportReserve({super.key,required this.reserveTripCubit});
  final ReserveTripCubit reserveTripCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveTripCubit(getIt.get<ReserveTripRepoImpl>()),
      child: BlocBuilder<ReserveTripCubit, ReserveTripState>(
        builder: (context, state) {

          return AddPassportWidget(reserveTripCubit: reserveTripCubit,);
        },
      ),
    );
  }
}

class AddPassportWidget extends StatelessWidget {
  const AddPassportWidget({
    super.key,
    required this.reserveTripCubit
  });
  final ReserveTripCubit reserveTripCubit ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          title:  Row(
            children: [
              const Text(' passport'),
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
                  'Passport number',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: reserveTripCubit.passportNumberController,
                    fill: false,
                    hintText: 'Passport number',
                    secure: false),
                const Gap(15),
                const Text(
                  'Passport issue date',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: reserveTripCubit.passportIssueDateController,
                    fill: false,
                    hintText: 'Passport issue date',
                    secure: false),
                const Gap(15),
                const Text(
                  'Passport expired date',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: reserveTripCubit.passportExpiresDateController,
                    fill: false,
                    hintText: 'Passport expire date',
                    secure: false),
                const Gap(15),
                DefaultElevated(label: 'save', fill: true, onPressed: () {
                  // passengerCubit.addPassengerPassport(
                  //     passportFirstName: passengerCubit.passportFirstName.text,
                  //     passportLastName: passengerCubit.passportLastName.text,
                  //     passportNumber: passengerCubit.passportNumber.text,
                  //     issueDate: passengerCubit.passportIssueDate.text,
                  //     expiredDate: passengerCubit.passportExpiredDate.text,
                  //     passengerId: id,
                  //     token: token);
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
