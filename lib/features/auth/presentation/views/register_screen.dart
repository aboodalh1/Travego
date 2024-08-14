import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/alert_dialog/loading_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/register_column/register_column.dart';
import '../manger/auth_cubit.dart';

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
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
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
