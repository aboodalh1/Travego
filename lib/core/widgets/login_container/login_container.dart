import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/translations/locale_keys.g.dart';
import '../../../features/auth/presentation/manger/auth_cubit.dart';
import '../../utils/screen_size_util.dart';
import '../../utils/shared/Widgets/default_button.dart';
import '../../utils/shared/components/components.dart';
import '../circled_form_field/circled_form_field.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    super.key,
    context,
    required this.usernameController,
    required this.cubit,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final AuthCubit cubit;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      width: ScreenSizeUtil.screenWidth * 0.9,
      height: ScreenSizeUtil.screenHeight * 0.7,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: ScreenSizeUtil.screenHeight * 0.03),
              child: Center(child: Image.asset('assets/images/ion_earth.png')),
            ),
            defaultCircleTextField(
              cursorColor: Colors.white,
              secure: false,
              fill: true,
              hintText: LocaleKeys.Email.tr(),
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              prefix: const Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
            ),
            const Gap(20),
            defaultCircleTextField(
              secure: cubit.loginIsSecure,
              fill: false,
              suffix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: cubit.loginChangeSecure,
                  child: cubit.loginSecureIcon,
                ),
              ),
              hintText: LocaleKeys.Password.tr(),
              controller: passwordController,
              cursorColor: defaultColor,
              prefix: Icon(
                CupertinoIcons.lock,
                color: defaultColor,
              ),
            ),
            const Gap(10),
            Row(
              children: [
                RadioMenuButton(
                  groupValue: true,
                  value: false,
                  onChanged: (value) {},
                  child: Text(
                    LocaleKeys.RememberMe.tr(),
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                     LocaleKeys.forgetPassword.tr(),
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ))
              ],
            ),
             Gap(ScreenSizeUtil.screenHeight*0.02),
            SizedBox(
              height: 50,
              child: DefaultElevated(
                onPressed: () {
                  cubit.login(
                    email: cubit.loginEmailController.text,
                    password: cubit.loginPasswordController.text,
                    context: context
                  );

                },
                label: LocaleKeys.Login.tr(),
                fill: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
