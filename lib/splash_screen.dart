import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:travego/features/first_screen.dart';
import 'core/utils/shared/components/components.dart';

Widget easySplash (){
  return EasySplashScreen(

    logo: const Image(image: AssetImage('assets/images/ion_earth.png'),
        fit: BoxFit.fill),
    title: const Text(
      "Travego",
      style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    ),
    backgroundColor: defaultColor,
    showLoader: false,
    navigator: FirstScreen(),
    durationInSeconds: 5,
  );
}
