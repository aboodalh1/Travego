// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/shared/components/components.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(defaultColor),
    fillColor: MaterialStateProperty.all(Colors.white12),

  ),
  colorScheme: const ColorScheme.light(primary: Colors.white),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: defaultColor),
  datePickerTheme: DatePickerThemeData(
    
    todayBorder: BorderSide(color: defaultColor),
    rangeSelectionBackgroundColor: defaultColor,
    headerForegroundColor: Colors.white,
    headerHelpStyle: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    backgroundColor: Colors.white,
    cancelButtonStyle: ButtonStyle(
    textStyle: MaterialStateProperty.all(
    GoogleFonts.inter(
    color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  ),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(Colors.grey),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    headerHeadlineStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    dividerColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: Colors.white,
    ),
    headerBackgroundColor: defaultColor,
    confirmButtonStyle: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        GoogleFonts.inter(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),

      backgroundColor: MaterialStateProperty.all(defaultColor),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    dayStyle: GoogleFonts.inter(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 15
    ),
    weekdayStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500
    ),
    shadowColor: defaultColor,
    dayForegroundColor: MaterialStateProperty.all(Colors.black),
  ),
  dialogTheme: DialogTheme(
    titleTextStyle: GoogleFonts.inter(
        fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
    iconColor: Colors.black,
    contentTextStyle: const TextStyle(
      color: Colors.black45,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: GoogleFonts.inter(
        fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.inter(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
    bodySmall: GoogleFonts.inter(
        color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500),
    labelSmall: GoogleFonts.inter(
        color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
    displaySmall: GoogleFonts.inter(
        color: Colors.black45, fontSize: 15, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.inter(
      color: Colors.black45,
      fontSize: 16,
    ),
    labelLarge: GoogleFonts.inter(
        fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black54),
    headlineMedium: GoogleFonts.inter(
        fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
    headlineLarge: GoogleFonts.inter(
        fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
  ),

  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) => defaultColor)

  ),
  scaffoldBackgroundColor: const Color(0xFFF7F7F7),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.black, size: 26),
    backgroundColor: const Color(0xFFF7F7F7),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: defaultColor,
        systemNavigationBarColor: defaultColor,
        statusBarIconBrightness: Brightness.light),
    titleTextStyle: GoogleFonts.inter(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);
