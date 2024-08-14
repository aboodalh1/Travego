import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';

import 'package:travego/features/Settings/presentation/manger/settings_cubit.dart';

import 'package:travego/features/Settings/repo/settings_repo_impl.dart';
import 'package:travego/translations/locale_keys.g.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../../../core/utils/shared/constant.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(getIt.get<SettingsRepoImpl>()),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if(state is DeleteAccountErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
          }
            },
        builder: (context, state) {
          SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(LocaleKeys.deleteAccountEnsure.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,),
              const Gap(20),
              Text(LocaleKeys.deleteAccountPassword.tr(),
                style:Theme.of(context).textTheme.titleMedium,),
              DeleteAccountTextField(label: LocaleKeys.accountPassword.tr(),settingsCubit: settingsCubit),
              const Gap(20),
              Text(LocaleKeys.deleteWalletPassword.tr(),
                  style:Theme.of(context).textTheme.titleMedium),
                    DeleteAccountTextField(label: LocaleKeys.wallet.tr(),settingsCubit: settingsCubit),
              const Gap(20),
              DefaultElevated(label: LocaleKeys.confirm.tr(), fill: true, onPressed: () {
                settingsCubit.deleteMyAccount(context, token: token);
              }
              )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DeleteAccountTextField extends StatelessWidget {
  final SettingsCubit settingsCubit;

  const DeleteAccountTextField({
    super.key,
    required this.settingsCubit,
    required this.label
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: settingsCubit.deleteAccountPassword,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.headlineLarge,
      decoration:InputDecoration(

        hintText: '$label',
        labelStyle: Theme.of(context).textTheme.labelSmall,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        suffixIcon: const Icon(Icons.lock),

      ),
    );
  }
}
