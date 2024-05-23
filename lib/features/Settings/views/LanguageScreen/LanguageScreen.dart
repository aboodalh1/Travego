import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/Settings/manger/settings_cubit.dart';

import '../../../../translations/locale_keys.g.dart';

class LanguageScreen extends StatelessWidget {
 const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final  settingCubit = BlocProvider.of<SettingsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.Choose_a_language.tr(),
            ),
          ),
          body: Column(
            children: <Widget>[
               RadioListTile(
                    title: Text(
                      'English',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: 'On',
                    groupValue: settingCubit.selectedValue,
                    onChanged: (value) {
                      settingCubit.selectOn(context);
                    },
                  ),
                RadioListTile(
                    title: Text(
                      'العربية',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: 'Off',
                    groupValue: settingCubit.selectedValue,
                    onChanged: (value) {
                      settingCubit.selectOff(context);
                    },
                  )
            ],
          ),
        );
      },
    );
  }
}
