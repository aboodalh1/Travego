import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo_impl.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../../../core/widgets/alert_dialog/loading_alert_dialog.dart';

class PassengerPassportScreen extends StatelessWidget {
  const PassengerPassportScreen(
      {super.key, required this.id, required this.passengerName});

  final num id;
  final String passengerName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengerCubit(getIt.get<PassengersRepoImpl>())
        ..getPassengerPassport(token: token, id: id),
      child: BlocConsumer<PassengerCubit, PassengerStates>(
        listener: (context, state) {
          if(state is PassengerAddInfoError){
              customSnackBar(context, state.error);
              showToast(text: state.error, state: ToastStates.ERROR);
          }
          if (state is PassengerAddInfoSuccess) {
            customSnackBar(context, state.message);
            showToast(text: state.message, state: ToastStates.SUCCESS);
          }if (state is PassengerAddInfoLoading) {
            customSnackBar(context, 'Loading...');
            showToast(text: 'Loading', state: ToastStates.WARNING);
          }
        },
        builder: (context, state) {
          PassengerCubit passengerCubit =
              BlocProvider.of<PassengerCubit>(context);
          if(state is PassengerAddInfoLoading){
            return const LoadingAlertDialog();
          }
          if (state is PassengerAddInfoError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertDialog(
                  title: Text(state.error),
                  content: Center(
                    child: DefaultElevated(
                        label: 'add Passport',
                        fill: true,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AddPassportWidget(
                                  id: id,
                                  passengerName: passengerName,
                                  passengerCubit: passengerCubit));
                        }),
                  ),
                ),
              ],
            );
          }
          return AddPassportWidget(
              passengerName: passengerName,
              passengerCubit: passengerCubit,
              id: id);
        },
      ),
    );
  }
}

class AddPassportWidget extends StatelessWidget {
  const AddPassportWidget({
    super.key,
    required this.passengerName,
    required this.passengerCubit,
    required this.id,
  });

  final String passengerName;
  final PassengerCubit passengerCubit;
  final num id;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            title: Row(
              children: [
                Text('$passengerName passport'),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    passengerCubit.deletePassengerPassport(token: token, id: id);
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
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
                  const Gap(15),
                  const Text(
                    'Passport last name',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: passengerCubit.passportLastName,
                      fill: false,
                      hintText: 'Passport last name',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Passport number',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: passengerCubit.passportNumber,
                      fill: false,
                      hintText: 'Passport number',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Passport issue date',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: passengerCubit.passportIssueDate,
                      fill: false,
                      hintText: 'Passport issue date',
                      tapFunction: () async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2040));
                        if (picked != null) {
                          passengerCubit.passportIssueDate.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      },
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Passport expired date',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: passengerCubit.passportExpiredDate,
                      fill: false,
                      tapFunction: () async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2040));
                        if (picked != null) {
                          passengerCubit.passportExpiredDate.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      },
                      hintText: 'Passport expire date',
                      secure: false),
                  const Gap(15),
                  DefaultElevated(
                      label: 'save',
                      fill: true,
                      onPressed: () {
                        passengerCubit.addPassengerPassport(
                            passportFirstName:
                                passengerCubit.passportFirstName.text,
                            passportLastName:
                                passengerCubit.passportLastName.text,
                            passportNumber: passengerCubit.passportNumber.text,
                            issueDate: passengerCubit.passportIssueDate.text,
                            expiredDate: passengerCubit.passportExpiredDate.text,
                            passengerId: id,
                            token: token);
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
