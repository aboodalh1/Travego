import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../manger/settings_cubit.dart';


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
                    selectedTileColor: Colors.black,
                    activeColor: Colors.black,
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
                    selectedTileColor: Colors.black,
                    activeColor: Colors.black,
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
