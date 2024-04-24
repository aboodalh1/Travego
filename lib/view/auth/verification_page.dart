// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:travego/view/auth/cubits/auth_cubit.dart';
import 'package:travego/view/auth/cubits/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/view/auth/register_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../core/utils/shared/Widgets/default_button.dart';
import '../../core/utils/shared/components/components.dart';

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
        if (state is AuthLodingState) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
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
                  const url = 'mailto:abdallahalharisy@gmail.com';
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: const Text(
                  "abdallahalharisy@gmail.com",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: VerificationCode(
                    itemSize: 40,
                    digitsOnly: true,
                    fullBorder: true,
                    textStyle:
                        const TextStyle(fontSize: 20.0, color: Colors.black),
                    keyboardType: TextInputType.number,
                    underlineColor: Colors.amber,
                    length: 6,
                    cursorColor: Colors.blue,
                    clearAll: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'clear all',
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.blue[700]),
                      ),
                    ),
                    onCompleted: (String value) {
                      BlocProvider.of<AuthCubit>(context).code = value;
                      BlocProvider.of<AuthCubit>(context).verifyCode(
                          code: BlocProvider.of<AuthCubit>(context)
                              .code
                              .toString(),
                          userId: '2');
                    },
                    onEditing: (bool value) {
                      BlocProvider.of<AuthCubit>(context).onEditing = value;
                      if (!BlocProvider.of<AuthCubit>(context).onEditing)
                        FocusScope.of(context).unfocus();
                    },
                  ),
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
                          BlocProvider.of<AuthCubit>(context).verifyCode(
                              code: BlocProvider.of<AuthCubit>(context)
                                  .code
                                  .toString(),
                              userId: '2');
                        }),
                    const SizedBox(width: 10),
                    DefaultElevated(
                        label: 'Edit your email',
                        fill: true,
                        onPressed: () {
                          navigateAndFinish(context, RegisterScreen());
                        }),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
