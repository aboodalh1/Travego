import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/Settings/presentation/manger/settings_cubit.dart';

import '../../../../../../core/utils/shared/constant.dart';
import '../../../../../../core/widgets/delete_confirm_dialog/delete_confirm_dialog.dart';
import '../../../../../../core/widgets/loading_failure_widget/loading_failure_widget.dart';

class MyPassportScreen extends StatelessWidget {
  const MyPassportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);

        if (state is GetUserInfoError && state.error.toString() == '404') {
          settingsCubit.isFound = false;
        }
        if (state is GetInfoError) {
          return ErrorLoadingScreen(
            buttonTitle: 'Try again',
            appBarTitle: 'My Personal ID Screen',
            centerTitle: state.error,
            onButtonPressed: () {
              settingsCubit.getMyPersonalId(token: token);
            },
            refreshFunction: () async {},
          );
        }
        return AddMyPassportCard(settingsCubit: settingsCubit);
      },
    );
  }
}

class AddMyPassportCard extends StatelessWidget {
  const AddMyPassportCard({
    super.key,
    required this.settingsCubit,
  });

  final SettingsCubit settingsCubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
              icon: const Icon(
                Icons.card_travel_sharp,
                size: 35,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    deleteConfirmDialog(context,
                        text: "Do you want to delete your passport details?",
                        function: () {
                      settingsCubit.deleteMyPassport(token: token);
                      if(Navigator.canPop(context))Navigator.pop(context);
                    });
                  },
                  icon: const Icon(Icons.delete),
                )
              ],
              title: const Text('My passport'),
              content: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Passport first name',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        controller: settingsCubit.passportFirstName,
                        fill: false,
                        hintText: 'Passport first name',
                        secure: false),
                    const Gap(15),
                    const Text(
                      'Passport last name',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        controller: settingsCubit.passportLastName,
                        fill: false,
                        hintText: 'Passport last name',
                        secure: false),
                    const Gap(15),
                    const Text(
                      'Passport number',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        controller: settingsCubit.passportNumber,
                        fill: false,
                        hintText: 'Passport number',
                        secure: false),
                    const Gap(15),
                    const Text(
                      'Passport issue date',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        controller: settingsCubit.passportIssueDate,
                        fill: false,
                        tapFunction: () async{
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime(2030));
                          if (picked != null) {
                            settingsCubit.passportIssueDate.text =
                                DateFormat('yyyy-MM-dd').format(picked);
                          }
                        },
                        hintText: 'Passport issue date',
                        secure: false),
                    const Gap(15),
                    const Text(
                      'Passport expired date',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        tapFunction: () async {
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime(2030));
                          if (picked != null) {
                            settingsCubit.passportExpiredDate.text =
                                DateFormat('yyyy-MM-dd').format(picked);
                          }
                        },
                        controller: settingsCubit.passportExpiredDate,
                        fill: false,
                        hintText: 'Passport expire date',
                        secure: false),
                    const Gap(15),
                    DefaultElevated(
                        label: 'save',
                        fill: true,
                        onPressed: () {
                          settingsCubit.addMyPassport(
                              passportFirstName:
                                  settingsCubit.passportFirstName.text,
                              passportLastName:
                                  settingsCubit.passportLastName.text,
                              passportNumber: settingsCubit.passportNumber.text,
                              token: token,
                              issueDate: settingsCubit.passportIssueDate.text,
                              expiredDate:
                                  settingsCubit.passportExpiredDate.text);
                        })
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
