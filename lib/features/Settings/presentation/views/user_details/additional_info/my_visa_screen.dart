import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:travego/features/Settings/presentation/manger/settings_cubit.dart';
import 'package:travego/features/Settings/repo/settings_repo_impl.dart';

import '../../../../../../core/utils/shared/constant.dart';
import '../../../../../../core/widgets/delete_confirm_dialog/delete_confirm_dialog.dart';

class MyVisaScreen extends StatelessWidget {
  const MyVisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SettingsCubit(getIt.get<SettingsRepoImpl>())..getMyVisa(token: token),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is AddInfoError) {
            customSnackBar(context, state.error);
          }
          if (state is AddInfoSuccess) {
            customSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);

          return AddMyVisaCard(settingsCubit: settingsCubit);
        },
      ),
    );
  }
}

class AddMyVisaCard extends StatelessWidget {
  const AddMyVisaCard({
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
            icon: const Icon(Icons.airplane_ticket,size: 35,),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  deleteConfirmDialog(context,
                      text:"Do you want to delete your Visa Information?",
                      function:(){
                        settingsCubit.deleteMyVisa(token: token);
                      }

                  );
                },
                icon: const Icon(Icons.delete),
              )
            ],
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add Visa Information',textAlign: TextAlign.center,),
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
                      controller: settingsCubit.visaType,
                      fill: false,
                      hintText: 'visa type',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Visa country',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: settingsCubit.visaCountry,
                      fill: false,
                      hintText: 'country',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Visa issue date',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: settingsCubit.visaIssueDate,
                      fill: false,
                      hintText: 'visa issue date',
                      tapFunction: ()async{
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
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Visa expired date',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: settingsCubit.visaExpiredDate,
                      fill: false,
                      tapFunction: ()async{
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
                      hintText: 'visa expired date',
                      secure: false),
                  const Gap(15),
                  DefaultElevated(
                      label: 'save',
                      fill: true,
                      onPressed: () {
                        settingsCubit.addMyVisa(
                            visaType: settingsCubit.visaType.text,
                            country: settingsCubit.visaCountry.text,
                            issueDate: settingsCubit.visaIssueDate.text,
                            expiredDate: settingsCubit.visaExpiredDate.text,
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
