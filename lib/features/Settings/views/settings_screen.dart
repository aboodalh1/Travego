import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/widgets/settings_container/settings_container.dart';
import 'package:travego/features/Settings/manger/settings_cubit.dart';
import 'package:travego/features/favorite/favorite_screen.dart';
import 'package:travego/features/auth/views/login_screen.dart';
import 'package:travego/features/Settings/views/edit_profile/edit_profile_screen.dart';

import '../../../core/utils/shared/components/components.dart';
import '../../../core/utils/shared/constant.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<SettingsCubit>(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: ScreenSizeUtil.screenHeight * 0.35,
                    decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              navigateTo(context, const FavoriteScreen());
                            },
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              size: 30,
                            ),
                            color: Colors.white,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              navigateAndFinish(context, LoginScreen());
                            },
                            icon: const Icon(
                              Icons.logout_outlined,
                              size: 30,
                            ),
                            color: Colors.white,
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSizeUtil.screenWidth * .35,
                        vertical: ScreenSizeUtil.screenHeight * .08),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/cover.png',
                          scale: 4.0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Gg',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 250, right: 20, left: 20),
                    child: Container(
                        height: ScreenSizeUtil.screenHeight * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isDark ? Colors.blueGrey[900] : Colors.white,
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: cubit.isEditProfile
                                ? EditProfileScreen()
                                : SettingsContainer(cubit: cubit),
                          ),
                        )),
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


GestureDetector settingsItem(
    {required Icon icon,
    required String label,
    required void Function() function}) {
  return GestureDetector(
    onTap: function,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 30,
          ),
          Text(label,
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    ),
  );
}

GestureDetector settingsSwitchItem({
  required Icon icon,
  context,
  required String label,
  switchFunction,
  required bool switchValue,
}) {
  return GestureDetector(
    // onTap: function,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 30,
          ),
          Text(label,
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
          const Spacer(),
          CupertinoSwitch(value: switchValue, onChanged: switchFunction),
        ],
      ),
    ),
  );
}
