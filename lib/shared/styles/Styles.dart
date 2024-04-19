// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travego/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white, size: 26),
      backgroundColor: HexColor('333739'),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light),
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor('333739'),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultSecondColor,
        unselectedItemColor: Colors.white,
        elevation: 20),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium:
          TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 15),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white60,
        fontSize: 15,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white),
    ),
    primaryColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white));
ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodySmall: const TextStyle(
        fontFamily: 'Poppins', color: Colors.grey, fontSize: 15),
    bodyMedium: const TextStyle(
        fontFamily: 'Poppins', color: Colors.black, fontSize: 15),
    labelMedium: TextStyle(
      fontFamily: 'Poppins',
      color: defaultSecondColor,
      fontSize: 16,
    ),
    labelLarge: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black54),
  ),
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black, size: 26),
    backgroundColor: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultSecondColor,
      unselectedItemColor: Colors.grey,
      elevation: 20),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);
