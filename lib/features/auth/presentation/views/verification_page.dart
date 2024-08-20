import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:travego/features/auth/presentation/views/register_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/utils/shared/Widgets/default_button.dart';
import '../../../../core/utils/shared/components/components.dart';
import '../manger/auth_cubit.dart';
import '../widgets/custom_verification_field.dart';

class VerificationScreen extends StatelessWidget {

  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is CodeVerificationLoadingState) {
            customSnackBar(context, 'verifying...');
        }
        if (state is CodeVerifySuccess) {
         customSnackBar(context, state.message);
        }
        if (state is CodeVerifyFailure) {
          customSnackBar(context, state.error);
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
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: defaultColor),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: customVerificationCode(cubit, context),
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.all(ScreenSizeUtil.screenHeight*0.009),
                     margin: EdgeInsets.only(bottom:ScreenSizeUtil.screenHeight*0.04),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(11),
                       border: Border.all(color:defaultColor)
                     ),
                    child: Text(
                      'Paste',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: defaultColor,
                      ),
                    ),
                  )
                ],
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
                  const Text(
                    'didn\'t get the code?',
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    child: Text(
                      'Resend new Code',
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


}
