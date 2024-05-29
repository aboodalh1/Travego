import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';

import '../../manger/settings_cubit.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is EditInformationSuccessState) {
          showDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                    title: Text(state.message),
                    content: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"),
                    ),
                  ));
        }
        if (state is EditInformationFailureState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          BlocProvider.of<SettingsCubit>(context)
                              .backToSettings();
                        }),
                    Text('Edit Profile',
                        style: Theme.of(context).textTheme.bodySmall),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          settingsCubit.editField();
                        },
                        icon: settingsCubit.editIcon),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'First Name',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Gap(ScreenSizeUtil.screenWidth * 0.3),
                    Text(
                      'Last Name',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: defaultCircleTextField(
                          isEnabled: settingsCubit.isEdit,
                          controller: settingsCubit.firstNameController,
                          prefix: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          fill: false,
                          secure: false),
                    ),
                    const Gap(5),
                    Expanded(
                      child: defaultCircleTextField(
                          isEnabled: settingsCubit.isEdit,
                          controller: settingsCubit.lastNameController,
                          prefix: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          fill: false,
                          secure: false),
                    ),
                  ],
                ),
                const Gap(10),
                const Text(
                  'Email',
                ),
                const Gap(5),
                defaultCircleTextField(
                    isEnabled: settingsCubit.isEdit,
                    controller: settingsCubit.emailController,
                    prefix: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    fill: false,
                    secure: false),
                const Gap(10),
                const Text(
                  'Phone number',
                ),
                const Gap(5),
                defaultCircleTextField(
                    isEnabled: settingsCubit.isEdit,
                    controller: settingsCubit.phoneController,
                    prefix: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    fill: false,
                    secure: false),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultElevated(
                      label: 'Save',
                      fill: true,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          settingsCubit.changeInformation(
                              token: token,
                              firstName: settingsCubit.firstNameController.text,
                              lastName: settingsCubit.lastNameController.text,
                              username: userModel!.body!.user!.theusername!,
                              phone: settingsCubit.phoneController.text);
                        }
                      },
                    ),
                    const Gap(10),
                    DefaultElevated(
                      label: 'Edit password',
                      fill: true,
                      onPressed: () {
                        settingsCubit.editPassword();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container editTextForm(TextEditingController controller) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}

/*
const Text(
                  'Current password',
                ),
                const Gap(5),
                defaultCircleTextField(
                    isEnabled: settingsCubit.isEdit,
                    controller: settingsCubit.currentPasswordController,
                    prefix: const Icon(Icons.lock,color: Colors.grey,),
                    fill: false,
                    secure: false),
                const Gap(10),
                const Text(
                  'New password',
                ),
                const SizedBox(height: 10,),
                defaultCircleTextField(
                    isEnabled: settingsCubit.isEdit,
                    controller: settingsCubit.newPasswordController,
                    prefix: const Icon(Icons.lock,color: Colors.grey,),
                    fill: false,
                    secure: false),

                const Gap(10),
                const Text(
                  'Confirm password',
                ),
                const Gap(5),
                defaultCircleTextField(
                    isEnabled: settingsCubit.isEdit,
                    controller: settingsCubit.passwordConfirmController,
                    prefix: const Icon(Icons.lock,color: Colors.grey,),
                    fill: false,
                    secure: false),
                const Gap( 20),

 */
