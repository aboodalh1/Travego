import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../../../core/widgets/alert_dialog/loading_alert_dialog.dart';
import '../../../repo/passengers_repo/passengers_repo_impl.dart';

class PassengerVisaScreen extends StatelessWidget {
  const PassengerVisaScreen({super.key, required this.id, required this.name});

  final num id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      PassengerCubit(getIt.get<PassengersRepoImpl>())
        ..getPassengerVisa(token: token, id: id),
      child: BlocConsumer<PassengerCubit, PassengerStates>(
        listener: (context, state) {
          if (state is PassengerAddInfoSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));
          }
          if (state is PassengerAddInfoError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          PassengerCubit passengerCubit =
          BlocProvider.of<PassengerCubit>(context);
          if (state is PassengerAddInfoLoading) {
            return LoadingAlertDialog();
          }
          if (state is PassengerAddInfoError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertDialog(
                  title: Text(state.error),
                  content: Center(child: DefaultElevated(
                      label: 'add visa', fill: true, onPressed: () {
                    showDialog(context: context, builder: (context) =>
                        EditVisaWidget(id: id,
                            name: name,
                            passengerCubit: passengerCubit));
                  }),),
                ),
              ],
            );
          }
          return EditVisaWidget(
              name: name, passengerCubit: passengerCubit, id: id);
        },
      ),
    );
  }
}

class EditVisaWidget extends StatelessWidget {
  const EditVisaWidget({
    super.key,
    required this.name,
    required this.passengerCubit,
    required this.id,
  });

  final String name;
  final PassengerCubit passengerCubit;
  final num id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          title: Row(
            children: [
              Text('$name Visa'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  passengerCubit.deletePassengerVisa(token: token, id: id);
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
                  'Visa type',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: passengerCubit.visaType,
                    fill: false,
                    hintText: 'visa type',
                    secure: false),
                const Gap(15),
                const Text(
                  'Visa country',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: passengerCubit.visaCountry,
                    fill: false,
                    hintText: 'country',
                    secure: false),
                const Gap(15),
                const Text(
                  'Visa issue date',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: passengerCubit.visaIssueDate,
                    tapFunction: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2040));
                      if (picked != null) {
                        passengerCubit.visaIssueDate.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                      }

                    },
                    fill: false,
                    hintText: 'visa issue date',
                    secure: false),
                const Gap(15),
                const Text(
                  'Visa expired date',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: passengerCubit.visaExpiredDate,
                    fill: false,
                    hintText: 'visa expired date',
                    tapFunction: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2040));
                      if (picked != null) {
                        passengerCubit.visaExpiredDate.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                      }

                    },
                    secure: false),
                const Gap(15),

                DefaultElevated(label: 'save', fill: true, onPressed: () {
                  passengerCubit.addPassengerVisa(
                      country: passengerCubit.visaCountry.text,
                      issueDate: passengerCubit.visaIssueDate.text,
                      expiredDate: passengerCubit.visaExpiredDate.text,
                      visaType: passengerCubit.visaType.text,
                      passengerId: id,
                      token: token);
                  Navigator.pop(context);
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
