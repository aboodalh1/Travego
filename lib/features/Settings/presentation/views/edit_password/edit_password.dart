import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';

import '../../manger/settings_cubit.dart';

// ignore: must_be_immutable
class EditPasswordScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          showDialog(context: context, builder: (context) =>
              CupertinoAlertDialog(
                title: Text(state.message),
                content: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"),
                ),
              ));
      }
        if(state is EditInformationFailureState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));

        }
      },
      builder: (context, state) {
        var settingsCubit = BlocProvider.of<SettingsCubit>(context);
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      BlocProvider.of<SettingsCubit>(context).editProfile();
                    }),
                Text('Edit Password',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall),
                const Text(
                  'Current password',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: settingsCubit.currentPasswordController,
                    prefix: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    fill: false,
                    secure: false),
                const Gap(10),
                const Text(
                  'New password',
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultCircleTextField(
                    controller: settingsCubit.newPasswordController,
                    prefix: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    fill: false,
                    secure: false),
                const Gap(10),
                const Text(
                  'Confirm password',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: settingsCubit.passwordConfirmController,
                    prefix: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    fill: false,
                    secure: false),
                const Gap(20),
                DefaultElevated(
                  label: 'Save',
                  fill: true,
                  onPressed: () {
                    settingsCubit.changePassword(currentPassword: settingsCubit
                        .currentPasswordController.text,
                        newPassword: settingsCubit.newPasswordController.text,
                        confirmNewPassword: settingsCubit
                            .passwordConfirmController.text,
                        token: token);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
