import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/features/auth/manger/auth_states.dart';
import 'package:travego/features/auth/manger/auth_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/auth/views/login_screen.dart';

import '../../../core/utils/shared/Widgets/default_button.dart';
import '../../../core/utils/shared/components/components.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLodingState) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  backgroundColor: Colors.white,
                  content: Row(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Loading")
                    ],
                  ),
                );
              });
        }
        if (state is AuthFailureState) {
          Navigator.pop(context);
          const SnackBar(content: Text('GGg00'));
        }
      },
      builder: (context, state) {
        return Scaffold(
            // resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: SingleChildScrollView(
              child: Stack(children: [
                Positioned(
                    right: 0,
                    child: Image.asset(
                      'assets/images/top_earth_register.png',
                      scale: 0.7,
                    )),
                Positioned(
                    left: -10,
                    bottom: -40,
                    child: Image.asset(
                      'assets/images/bottom_earth_login.png',
                      scale: 0.9,
                    )),
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 30),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            width: 258,
                            height: 80,
                            child: Text(
                              "Let's start your Journey together!",
                              textAlign: TextAlign.start,
                              //style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              style: GoogleFonts.inter(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                              // fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                              child:
                                  Image.asset('assets/images/ion_earth.png')),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Username',
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          defaultTextField(
                              inputType: TextInputType.emailAddress,
                              controller: usernameController,
                              prefix: const Icon(CupertinoIcons.person),
                              suffix: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      child: child, scale: animation);
                                },
                                child: Icon(
                                  BlocProvider.of<AuthCubit>(context)
                                      .authInfoIconData,
                                  key: ValueKey<IconData>(BlocProvider.of<
                                          AuthCubit>(context)
                                      .authInfoIconData), // This is important for the animation to work
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Email',
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          defaultTextField(
                            controller: emailController,
                            prefix: const Icon(CupertinoIcons.mail),
                            suffix: const Icon(
                                CupertinoIcons.check_mark_circled,
                                color: Color.fromRGBO(0, 143, 160, 1)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Password',
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          defaultTextField(
                            controller: passwordController,
                            prefix: const Icon(CupertinoIcons.lock),
                            suffix: const Icon(CupertinoIcons.eye_fill,
                                color: Color.fromRGBO(0, 143, 160, 1)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Confirm Password',
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          defaultTextField(
                            controller: passwordConfirmationController,
                            prefix: const Icon(CupertinoIcons.lock_fill),
                            suffix: const Icon(CupertinoIcons.eye_fill,
                                color: Color.fromRGBO(0, 143, 160, 1)),
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
                          SizedBox(
                            height: 50,
                            child: DefaultElevated(
                              onPressed: () {
                                BlocProvider.of<AuthCubit>(context).register(
                                    username:
                                        usernameController.text.toString(),
                                    email: emailController.text.toString(),
                                    password:
                                        passwordController.text.toString(),
                                    passwordConfirmation:
                                        passwordConfirmationController.text,
                                    context: context);
                              },
                              label: "Create Account",
                              fill: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
                              child: Text(
                                "already have account?",
                                style: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: DefaultElevated(
                              onPressed: () {
                                navigateAndFinish(context, LoginScreen());
                              },
                              label: 'Sign in',
                              fill: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ));
      },
    );
  }
}
