import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/translations/locale_keys.g.dart';
import '../../../features/auth/presentation/manger/auth_cubit.dart';
import '../../../features/auth/presentation/views/login_screen.dart';
import '../../../features/auth/presentation/views/register_screen.dart';
import '../../utils/shared/Widgets/default_button.dart';
import '../../utils/shared/components/components.dart';
import '../circled_form_field/circled_form_field.dart';
import '../country_drop_list/country_drop_down_list.dart';

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
    return SafeArea(
      child: Column(
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
          FormFieldText(
            title: LocaleKeys.Phone.tr(),
      
          ),
          const Gap(6),
          Row(
            children: [
              const Expanded(child: CountryDropdown()),
              const Gap(5),
              Expanded(
                flex: 2,
                child: defaultCircleTextField(
                    controller: phoneController,
                    prefix: Icon(
                      Icons.phone,
                      color: Colors.grey[700],
                    ),
                    cursorColor: defaultColor,
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
                    FormFieldText(
                      title: LocaleKeys.FirstName.tr(),
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
              const Gap(5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormFieldText(
                      title: LocaleKeys.LastName.tr(),
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
           FormFieldText(
            title: LocaleKeys.Username.tr(),
          ),
          const Gap(6),
          defaultCircleTextField(
            secure: false,
            hintText: LocaleKeys.YourUsernameInThisApp.tr(),
            controller: usernameController,
            prefix: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            fill: true,
          ),
          const Gap(20),
          const FormFieldText(
            title: LocaleKeys.Email,
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
          const Gap(20),
          FormFieldText(
            title: LocaleKeys.Password.tr(),
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
            function: (value){
              if(value.length>=8 && value.toLowerCase() !=value){
                cubit.isAuthCorrect = true;
                cubit.checkPassword(cubit.isAuthCorrect);
              }
              else {
                cubit.isAuthCorrect = false;
                cubit.checkPassword(cubit.isAuthCorrect);
      
              }
            },
            suffix: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: cubit.registerChangeSecure,
                      child: cubit.registerSecureIcon),
                  const Gap(5),
                  cubit.acceptPasswordIcon
                ],
              ),
            ),
            fill: true,
          ),
          const Gap(20),
          FormFieldText(
            title: LocaleKeys.ConfirmPassword.tr(),
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
            function: (value){
              if(value==cubit.passwordController.text && value.isNotEmpty){
                cubit.isPasswordsMatch = true;
                cubit.checkMatchPassword(cubit.isPasswordsMatch);}
              else {cubit.isPasswordsMatch= false;
      
              cubit.checkMatchPassword(cubit.isPasswordsMatch);}
      
            },
            suffix: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: cubit.registerChangeSecure,
                      child: cubit.registerSecureIcon),
                  const Gap(5),
                  cubit.acceptConfPasswordIcon
                ],
              ),
            ),
            fill: true,
          ),
          const Gap(10),
          RadioMenuButton(
            groupValue: true,
            value: false,
            onChanged: (value) {},
            child: Text(
              LocaleKeys.RememberMe.tr(),
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
              label: LocaleKeys.Register.tr(),
              fill: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Text(
                LocaleKeys.AlreadyHaveAccount.tr(),
                style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: DefaultElevated(
              onPressed: () {
                navigateAndFinish(context, const LoginScreen());
              },
              label: LocaleKeys.Login.tr(),
              fill: false,
            ),
          ),
        ],
      ),
    );
  }
}
