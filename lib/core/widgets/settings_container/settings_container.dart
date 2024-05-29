import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/features/Settings/presentation/views/passengers/passengers_screen.dart';
import '../../../features/Settings/presentation/manger/settings_cubit.dart';
import '../../../features/Settings/presentation/views/LanguageScreen/LanguageScreen.dart';
import '../../../features/Settings/presentation/views/settings_screen.dart';
import '../../../translations/locale_keys.g.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({
    super.key,
    required this.cubit,
  });

  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.Account.tr(),
          style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenSizeUtil.screenHeight * 0.01,
        ),
        settingsItem(
          function: () {
            cubit.editProfile();
          },
          icon: const Icon(CupertinoIcons.person_crop_circle_fill),
          label: LocaleKeys.Edit_profile.tr(),
        ),
        settingsItem(
          function: () {
            navigateTo(context, const PassengersScreen());
          },
          icon: const Icon(CupertinoIcons.airplane),
          label: 'Passengers',
        ),
        settingsItem(
            function: () {},
            icon: const Icon(CupertinoIcons.lock_fill),
            label: LocaleKeys.Privacy.tr()),
        settingsItem(
            function: () {},
            icon: const Icon(CupertinoIcons.shield),
            label: LocaleKeys.Security.tr()),
        settingsItem(
            function: () {
              navigateTo(context, const LanguageScreen());
            },
            icon: const Icon(Icons.translate),
            label: LocaleKeys.Language.tr()),
        settingsSwitchItem(
            switchFunction: (bool value) {
              cubit.notificationToggleSwitch();
            },
            switchValue: cubit.notificationSwitchValue,
            icon: const Icon(CupertinoIcons.bell_solid),
            label: LocaleKeys.Notification.tr()),
        settingsSwitchItem(
            context: context,
            switchValue: cubit.themeSwitchValue,
            switchFunction: (bool value) {
              cubit.themeToggleSwitch();
            },
            icon: const Icon(CupertinoIcons.moon_fill),
            label: LocaleKeys.Dark_mode.tr()),
        SizedBox(
          height: ScreenSizeUtil.screenHeight * 0.02,
        ),
        Text(
          LocaleKeys.Help_Support.tr(),
          style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenSizeUtil.screenHeight * 0.01,
        ),
        settingsItem(
            function: () {},
            icon: const Icon(CupertinoIcons.exclamationmark_circle_fill),
            label: LocaleKeys.Help_Support.tr()),
        settingsItem(
            function: () {},
            icon: const Icon(CupertinoIcons.question_circle_fill),
            label: LocaleKeys.Terms_and_Policies.tr()),
        SizedBox(
          height: ScreenSizeUtil.screenHeight * 0.02,
        ),
        Text(
          LocaleKeys.Actions.tr(),
          style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenSizeUtil.screenHeight * 0.01,
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
            child: Row(
              children: [
                Text(LocaleKeys.Delete_my_account.tr(),
                    style: GoogleFonts.inter(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
