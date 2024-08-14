import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/features/Settings/repo/settings_repo_impl.dart';

import '../../../../../core/utils/shared/constant.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../manger/settings_cubit.dart';


class LanguageScreen extends StatefulWidget {
 const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SettingsCubit(getIt.get<SettingsRepoImpl>()),
  child: BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final  settingCubit = BlocProvider.of<SettingsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.ChooseALanguage.tr(),
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
                    onChanged: (value) async{
                      setState(() {
                        settingCubit.selectedValue = 'On';

                           context.setLocale(const Locale('en'));

                        isLTR = false;

                      });
                      // settingCubit.selectOn(context);
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
                      setState(() {
                        settingCubit.selectedValue = 'Off';
                         context.setLocale(const Locale('ar'));
                        isLTR = true;

                      });
                      // settingCubit.selectOff( context);
                    },
                  )
            ],
          ),
        );
      },
    ),
);
  }
}
