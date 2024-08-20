
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/constant.dart';
import '../../../../../auth/presentation/manger/auth_cubit.dart';
import '../../../../../favorite/presentation/view/favorite_screen.dart';
import '../../../manger/settings_cubit.dart';
import '../../edit_password/edit_password.dart';
import '../../edit_profile/edit_profile_screen.dart';
import '../settings_container/settings_container.dart';

class SettingsStack extends StatelessWidget {
const SettingsStack({
    super.key,
    required this.cubit,
  });

  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: ScreenSizeUtil.screenHeight * 0.38,
          decoration: BoxDecoration(
              color: defaultColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60))),
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
                    BlocProvider.of<AuthCubit>(context)
                        .logout(context);
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
              vertical: ScreenSizeUtil.screenHeight * 0.08),
          child: Column(
            children: [
              Image.asset(
                'assets/images/cover.png',
                scale: 4.5,
              ),
              ListTile(
                title: Text(
                  textAlign: TextAlign.center,
                  '${cubit.userAccountModel!.body!.firstName} ${cubit.userAccountModel!.body!.lastName}',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                subtitle:Text(
                  textAlign: TextAlign.center,
                  '${cubit.userAccountModel!.body!.phoneNumber}',
                  style: GoogleFonts.inter(
                      color: Colors.grey[350],
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(top: ScreenSizeUtil.screenHeight*.35, right: 20, left: 20),
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
                      :cubit.isEditPassword ? EditPasswordScreen() : SettingsContainer(cubit: cubit),
                ),
              )),
        )
      ],
    );
  }
}

