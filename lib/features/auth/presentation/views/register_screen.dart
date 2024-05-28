import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

//ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/core/widgets/country_drop_list/country_drop_down_list.dart';
import '../../../../core/utils/shared/Widgets/default_button.dart';
import '../../../../core/utils/shared/components/components.dart';
import '../../../../core/widgets/alert_dialog/loading_alert_dialog.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/auth_cubit.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showDialog(
              context: context,
              builder: (context) {
                return const LoadingAlertDialog();
              });
        }
        if (state is AuthFailureState) {
          if(Navigator.canPop(context)){
          Navigator.pop(context);}
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey,
            content: Text(state.error.toString()),
          ));
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
                    child: RegisterColumn(
                        phoneController: cubit.phoneController,
                        firstNameController: cubit.firstNameController,
                        lastNameController: cubit.lastNameController,
                        usernameController: cubit.usernameController,
                        emailController: cubit.emailController,
                        cubit: cubit,
                        passwordController: cubit.passwordController,
                        passwordConfirmationController:
                            cubit.passwordConfirmationController),
                  ),
                ),
              ]),
            ));
      },
    );
  }
}

class RegisterColumn extends StatelessWidget {
  const RegisterColumn({
    super.key,
    required this.phoneController,
    required this.firstNameController,
    required this.lastNameController,
    required this.usernameController,
    required this.emailController,
    required this.cubit,
    required this.passwordController,
    required this.passwordConfirmationController,
  });

  final TextEditingController phoneController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final AuthCubit cubit;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's start your\nJourney together!",
          textAlign: TextAlign.start,
          style: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Center(child: Image.asset('assets/images/ion_earth.png')),
        const SizedBox(
          height: 10,
        ),
        const FormFieldText(title: 'phone',),
        const Gap(6),
        Row(
          children: [
            Expanded(child: CountryDropdown()),
            const Gap(5),
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
                  const FormFieldText(title: 'First name',),
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
            const Gap(5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormFieldText(title: 'Last name',),
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
        const FormFieldText(title: 'Username',),
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
        const Gap(20),
        const FormFieldText(title: 'Email',),
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
        const Gap(20),
        FormFieldText(title: 'Password',),
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
        const Gap(20),
        FormFieldText(title: 'Confirm password',),
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
        const Gap(10),
        RadioMenuButton(
          groupValue: true,
          value: false,
          onChanged: (value) {},
          child: Text(
            'Remember me',
            style: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        const Gap(20),
        SizedBox(
          height: 50,
          child: DefaultElevated(
            onPressed: () {
              cubit.register(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  username: usernameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  password: passwordController.text,
                  confirmPassword: passwordConfirmationController.text,
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
    );
  }
}

class FormFieldText extends StatelessWidget {
  const FormFieldText({
    required this.title,
    super.key,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
          fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
    );
  }
}
