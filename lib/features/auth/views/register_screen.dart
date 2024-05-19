
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

//ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/core/widgets/country_drop_list/country_drop_down_list.dart';
import 'package:travego/features/auth/manger/auth_states.dart';
import 'package:travego/features/auth/manger/auth_cubit.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/auth/views/login_screen.dart';

import '../../../core/utils/shared/Widgets/default_button.dart';
import '../../../core/utils/shared/components/components.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar( backgroundColor: Colors.grey,
                content: Row(
                  children: [
                    Expanded(child: Text(state.error.toString())),
                    Spacer(),
                    CircularProgressIndicator(
                      color: Colors.white24,
                    ),
                  ],
                ),)
          );
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's start your\nJourney together!",
                          textAlign: TextAlign.start,
                          //style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          style: GoogleFonts.inter(
                              fontSize: 25, fontWeight: FontWeight.w700),
                          // fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        Center(
                            child:
                                Image.asset('assets/images/ion_earth.png')),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Phone',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(6),
                        Row(
                          children: [
                            Expanded(child: CountryDropdown()),
                            Gap(5),
                            Expanded(
                              flex: 2,
                              child: defaultCircleTextField(
                                  controller: phoneController,
                                  prefix: Icon(
                                    Icons.phone,
                                    color: Colors.grey[700],
                                  ),
                                  fill: false,
                                  secure: false),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'First name',
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Gap(6),
                                  defaultCircleTextField(
                                    hintText: 'AbdAllah',
                                    secure: false,
                                    controller: firstNameController,
                                    prefix: const Icon(
                                      Icons.person_pin_rounded,
                                      color: Colors.white,
                                    ),
                                    fill: true,
                                  ),
                                ],
                              ),
                            ),
                            Gap(5),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Last name',
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Gap(6),
                                  defaultCircleTextField(
                                    hintText: 'Gg',
                                    secure: false,
                                    controller: lastNameController,
                                    prefix: const Icon(
                                      Icons.person_pin_rounded,
                                      color: Colors.white,
                                    ),
                                    fill: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Username',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(6),
                        defaultCircleTextField(
                          secure: false,
                          hintText: 'your username in this app',
                          controller: usernameController,
                          prefix: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          fill: true,
                        ),
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
                        const Gap(6),
                        defaultCircleTextField(
                          hintText: 'example@gmail.com',
                          secure: false,
                          controller: emailController,
                          prefix: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          fill: true,
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
                        const Gap(6),
                        defaultCircleTextField(
                          hintText: '********',
                          secure: cubit.registerIsSecure,
                          controller: passwordController,
                          prefix: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: cubit.registerChangeSecure,
                                child: cubit.registerSecureIcon),
                          ),
                          fill: true,
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
                        const Gap(6),
                        defaultCircleTextField(
                          hintText: '********',
                          secure: cubit.registerIsSecure,
                          controller: passwordConfirmationController,
                          prefix: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: cubit.registerChangeSecure,
                                child: cubit.registerSecureIcon),
                          ),
                          fill: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: DefaultElevated(
                            onPressed: () {
                              cubit.register(
                                firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  username:
                                      usernameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password:
                                      passwordController.text,
                                  confirmPassword:
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
              ]),
            ));
      },
    );
  }
}
