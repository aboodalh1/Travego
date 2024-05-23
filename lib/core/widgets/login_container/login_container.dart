import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../features/auth/manger/auth_cubit.dart';
import '../../../features/layout.dart';
import '../../utils/screen_size_util.dart';
import '../../utils/shared/Widgets/default_button.dart';
import '../../utils/shared/components/components.dart';
import '../../utils/shared/constant.dart';
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Center(child: Image.asset('assets/images/ion_earth.png')),
          ),
          defaultCircleTextField(
            secure: false,
            fill: true,
            hintText: 'email',
            controller: usernameController,
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
            hintText: 'password',
            controller: passwordController,
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
                  'Remember me',
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
                    "Forget password",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ))
            ],
          ),
          const Gap(20),
          SizedBox(
            height: 50,
            child: DefaultElevated(
              onPressed: () {
                cubit.login(
                  email: cubit.loginEmailController.text,
                  password: cubit.loginPasswordController.text,
                  context: context
                );
                print(token);
              },
              label: "Log in",
              fill: true,
            ),
          ),
        ],
      ),
    );
  }
}
