import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/widgets/alert_dialog/loading_alert_dialog.dart';
import 'package:travego/features/Settings/presentation/manger/settings_cubit.dart';
import 'package:travego/features/Settings/repo/settings_repo_impl.dart';

import '../../../../../core/utils/shared/Widgets/default_button.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../../../core/widgets/circled_form_field/circled_form_field.dart';
import '../../../../../core/widgets/custom_progress_indicator/custom_progress_indicator.dart';
import '../../../../../core/widgets/custom_snack_bar/custom_snack_bar.dart';
import '../../../../../core/widgets/delete_confirm_dialog/delete_confirm_dialog.dart';
import '../../../../../core/widgets/loading_failure_widget/loading_failure_widget.dart';

class MyDetailsScreen extends StatelessWidget {
  const MyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(getIt.get<SettingsRepoImpl>())..getMyDetails(token: token),
        //..getMyDetails(token: token),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {

          if (state is GetInfoError) {
            customSnackBar(
                context,
                state.error.toString() == '404'
                    ?  "You didn't add this information yet"
                    : state.error);
          }
          if (state is AddInfoError) {
            customSnackBar(context, state.error);
          }
          if (state is AddInfoSuccess) {
            customSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
          if(state is GetInfoLoading){
            return Scaffold(body: LoadingAlertDialog());
          }
          if (state is GetInfoError && state.error.toString() != '404') {
            return ErrorLoadingScreen(
              buttonTitle: 'Try again',
              appBarTitle: 'My Personal ID Screen',
              centerTitle: 'Check your connection',
              onButtonPressed: () {
                settingsCubit.getMyPersonalId(token: token);
              },
              refreshFunction: () async {},
            );
          }
          return RefreshIndicator(
            color: defaultColor,
            onRefresh: () async {
              settingsCubit.navBarSelectedItem == 0
                  ? settingsCubit.getMyPassport(token: token)
                  : settingsCubit.navBarSelectedItem == 1
                  ? settingsCubit.getMyVisa(token: token)
                  : settingsCubit.getMyPersonalId(token: token);
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('My details'),
              ),

              body: state is GetInfoLoading? const Center(child: CustomProgressIndicator(),):
              BlocConsumer<SettingsCubit, SettingsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);

                  if (state is GetUserInfoError && state.error.toString() == '404') {
                    settingsCubit.isFound = false;
                  }
                  if (state is GetInfoError && state.error.toString() != '404') {
                    return ErrorLoadingScreen(
                      buttonTitle: 'Try again',
                      appBarTitle: 'My Personal ID Screen',
                      centerTitle: 'Check your connection',
                      onButtonPressed: () {
                        settingsCubit.getMyPersonalId(token: token);
                      },
                      refreshFunction: () async {},
                    );
                  }
                  return AddMyDetailsCard(settingsCubit: settingsCubit);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddMyDetailsCard extends StatelessWidget {
  const AddMyDetailsCard({
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
                        text: "Do you want to delete your details?",
                        function: () {
                          settingsCubit.deleteMyPassport(token: token);
                        });
                  },
                  icon: const Icon(Icons.delete),
                )
              ],
              title: const Text('My Details'),
              content: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Father name',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        controller: settingsCubit.fatherNameController,
                        fill: false,
                        hintText: 'Father name',
                        secure: false),
                    const Gap(15),
                    const Text(
                      'Mother name',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        controller: settingsCubit.motherNameController,
                        fill: false,
                        hintText: 'Passport last name',
                        secure: false),
                    const Gap(15),
                    const Text(
                      'Gender',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        controller: settingsCubit.myGenderController,
                        fill: false,
                        hintText: 'Gender',
                        secure: false),
                    const Gap(15),
                    const Text(
                      'Birth date',
                    ),
                    const Gap(5),
                    defaultCircleTextField(
                        controller: settingsCubit.myBirthDateController,
                        fill: false,
                        tapFunction: () async{
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime(2030));
                          if (picked != null) {
                            settingsCubit.myBirthDateController.text =
                                DateFormat('yyyy-MM-dd').format(picked);
                          }
                        },
                        hintText: 'Birth date',
                        secure: false),
                    const Gap(15),
                    DefaultElevated(
                        label: 'save',
                        fill: true,
                        onPressed: () {
                          settingsCubit.addMyDetails(
                              fatherName:
                              settingsCubit.fatherNameController.text,
                              motherName:
                              settingsCubit.motherNameController.text,
                              gender: settingsCubit.myGenderController.text,
                              token: token,
                              birthDate: settingsCubit.myBirthDateController.text,
                             );
                        })
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
