import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/widgets/alert_dialog/loading_alert_dialog.dart';
import 'package:travego/features/auth/presentation/views/register_screen.dart';
import 'package:travego/translations/locale_keys.g.dart';

import '../../../../core/utils/shared/components/components.dart';
import '../../../../core/utils/shared/constant.dart';
import '../../../../core/widgets/login_container/login_container.dart';
import '../manger/auth_cubit.dart';


// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showDialog(
              context: context, builder: (context) => const LoadingAlertDialog());
        }
        if (state is AuthFailureState) {
          if(Navigator.canPop(context)){
            Navigator.pop(context);
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey,
            content: Text(state.error.toString()=='404'? 'Email not found':state.error.toString()),
          ));
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
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
                right: isLTR? 25.0:25.0,
                left: isLTR? 0.0 :20.0,
                top: ScreenSizeUtil.screenHeight * 0.06,
                child: Text(
                  LocaleKeys.Travego.tr(),
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ),
              Positioned(
                bottom: ScreenSizeUtil.screenHeight * 0.04,
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.DontHaveAnAccount.tr(),
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    TextButton(
                      child: Text(
                        LocaleKeys.SignUp.tr(),
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        navigateAndFinish(context, const RegisterScreen());
                      },
                    ),
                  ],
                ),
              ),

              Center(
                  child: LoginContainer(
                      usernameController: cubit.loginEmailController,
                      cubit: cubit,
                      passwordController: cubit.loginPasswordController,)),
            ],
          ),
        );
      },
    );
  }
}
