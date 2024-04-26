import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/features/auth/manger/auth_cubit.dart';
import 'package:travego/features/auth/manger/auth_states.dart';
import 'package:travego/features/auth/views/register_screen.dart';
import 'package:travego/features/layout.dart';

import '../../../core/utils/shared/Widgets/default_button.dart';
import '../../../core/utils/shared/components/components.dart';
import '../../../core/widgets/circled_form_field/circled_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  late AnimationController animationController;

  late Animation slidingAnimation;

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;
    // var cubit = AuthCubit.get(context);
    final verticalPadding = mediaQueryData.size.height;
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: defaultColor,
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  right: 0,
                  child: Image.asset(
                    'assets/images/top_earth_login.png',
                    scale: 0.7,
                  )),
              Positioned(
                  left: -10,
                  bottom: -40,
                  child: Image.asset(
                    'assets/images/bottom_earth_register.png',
                    scale: 0.9,
                  )),
              Positioned(
                left: 19.0,
                top: verticalPadding * 0.06,
                child: Text(
                  "Welcome Back!",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ),
              Positioned(
                bottom: verticalPadding * 0.04,
                child: Row(
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    TextButton(
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        navigateAndFinish(context, RegisterScreen());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                width: horizontalPadding * 0.9,
                height: verticalPadding * 0.7,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Center(
                          child: Image.asset('assets/images/ion_earth.png')),
                    ),
                    deafultCircleTextField(
                      secure: false,
                      fill: true,
                      usernameController: usernameController,
                      prefix: const Icon(
                        CupertinoIcons.mail,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    deafultCircleTextField(
                      secure: true,
                      fill: false,
                      usernameController: passwordController,
                      prefix: Icon(
                        CupertinoIcons.lock,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: DefaultElevated(
                        onPressed: () {
                          navigateAndFinish(context, LayoutScreen());
                        },
                        label: "Log in",
                        fill: true,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}
