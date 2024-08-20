import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/Settings/presentation/manger/settings_cubit.dart';

import '../../../../../../core/utils/shared/constant.dart';
import '../../../../../../core/widgets/delete_confirm_dialog/delete_confirm_dialog.dart';

class MyPersonalIdScreen extends StatelessWidget {
  const MyPersonalIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
        return AddMyPIDCard(
          settingsCubit: settingsCubit,
        );
      },
    );
  }
}

class AddMyPIDCard extends StatelessWidget {
  const AddMyPIDCard({
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
            icon: const Icon(Icons.person),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  deleteConfirmDialog(context,
                      text: "Do you want to delete your Personal ID details?",
                      function: () {
                    settingsCubit.deleteMyPersonalId(token: token);
                    if(Navigator.canPop(context))Navigator.pop(context);
                  });
                },
                icon: const Icon(Icons.delete),
              )
            ],
            title: const Text('My Personal id'),
            content: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Id first name',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: settingsCubit.idFirstName,
                      fill: false,
                      hintText: 'id first name',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Id last name',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: settingsCubit.idLastName,
                      fill: false,
                      hintText: 'id last name',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Id birthday',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: settingsCubit.idBirthDate,
                      fill: false,
                      tapFunction: ()async{
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2030));
                        if (picked != null) {
                          settingsCubit.idBirthDate.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      },
                      hintText: 'id birthday',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Id nationality',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: settingsCubit.idNationality,
                      fill: false,
                      hintText: 'nationality',
                      secure: false),
                  const Gap(15),
                  DefaultElevated(
                      label: 'save',
                      fill: true,
                      onPressed: () {
                        settingsCubit.addMyPersonalId(
                            idfirstName: settingsCubit.idFirstName.text,
                            idlastName: settingsCubit.idLastName.text,
                            idBirthDate: settingsCubit.idBirthDate.text,
                            nationality: settingsCubit.idNationality.text,
                            token: token);
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
