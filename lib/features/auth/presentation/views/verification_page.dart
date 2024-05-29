// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/features/auth/presentation/views/register_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/utils/shared/Widgets/default_button.dart';
import '../../../../core/utils/shared/components/components.dart';
import '../manger/auth_cubit.dart';

// ignore: must_be_immutable
class VerificationScreen extends StatelessWidget {
  SnackBar snackBar = const SnackBar(
    backgroundColor: Colors.grey,
    content: Row(
      children: [
        Text('verifying...'),
        Spacer(),
        CircularProgressIndicator(
          color: Colors.white24,
        ),
      ],
    ),
  );

  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is CodeVerificationLoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is CodeVerifySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey,
            content: Text(state.message.toString()),
          ));
        }
        if (state is CodeVerifyFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.grey,
              content: Text(state.error.toString())));
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text("verify code"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  textAlign: TextAlign.center,
                  "A verify code sent to your email: \n ",
                  style:
                      GoogleFonts.inter(fontSize: 15, color: Colors.black87)),
              TextButton(
                onPressed: () async {
                  var url = 'mailto:${cubit.emailController}';
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  cubit.emailController.text,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: customVerificationCode(cubit, context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultElevated(
                        label: 'Confirm',
                        fill: true,
                        onPressed: () {
                          cubit.verifyCode(
                            context: context,
                              code: cubit.code.toString(),
                              email: cubit.emailController.text);
                        }),
                    const SizedBox(width: 10),
                    DefaultElevated(
                        label: 'Edit your email',
                        fill: true,
                        onPressed: () {
                          navigateAndFinish(context, const RegisterScreen());
                        }),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'didn\'t get the code?',
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    child: Text(
                      'Resnd new Code',
                      style: TextStyle(color: defaultColor, fontSize: 14),
                    ),
                    onPressed: () {
                      cubit.regenerateCode(email: cubit.emailController.text);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  VerificationCode customVerificationCode(
      AuthCubit cubit, BuildContext context) {
    return VerificationCode(
      itemSize: 40,
      digitsOnly: false,
      fullBorder: true,
      textStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
      keyboardType: TextInputType.text,
      underlineColor: Colors.amber,
      length: 6,
      cursorColor: Colors.blue,
      clearAll: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'clear all',
          style: TextStyle(fontSize: 14.0, color: Colors.blue[700]),
        ),
      ),
      onCompleted: (String value) {
        print(value);
        cubit.code = value;
        print(cubit.code.toString());
        cubit.verifyCode(code: cubit.code.toString(), email: '2');
      },
      onEditing: (bool value) {
        cubit.onEditing = value;
        if (!cubit.onEditing) {
          FocusScope.of(context).unfocus();
        }
      },
    );
  }
}
