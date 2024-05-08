import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/features/Settings/manger/settings_cubit.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        var settingsCubit = BlocProvider.of<SettingsCubit>(context);
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){
                      BlocProvider.of<SettingsCubit>(context).editProfile();
                                }),
                    Text('Edit Profile', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                Text(
                  'Username',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10,),
                editTextForm(settingsCubit.userNameController),
                const Text(
                  'Email',
                ),
                const SizedBox(height: 10,),
                editTextForm(settingsCubit.emailController),
                const Text(
                  'Current password',
                ),
                const SizedBox(height: 10,),
                editTextForm(settingsCubit.currentPasswordController),
                const Text(
                  'New password',
                ),
                const SizedBox(height: 10,),
                editTextForm(settingsCubit.newPasswordController),
                const Text(
                  'Confirm password',
                ),
                const SizedBox(height: 10,),
                editTextForm(settingsCubit.passwordConfrimController),
                const SizedBox(height: 20,),
                DefaultElevated(
                    label: 'Save',
                    fill: true,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        settingsCubit.editProfile();
                      }
                    },
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
                  decoration: const InputDecoration(
                      border: InputBorder.none
                  ),
                ),
              );
  }
}
