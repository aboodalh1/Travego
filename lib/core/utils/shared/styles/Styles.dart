// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.grey.shade300,
    ),
    labelSmall: GoogleFonts.inter(
      color: Colors.grey.shade300,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.inter(
      color: Colors.white,
      fontSize: 15,
    ),
    labelMedium: GoogleFonts.inter(
      color: Colors.grey.shade400,
      fontSize: 16,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: Colors.white.withOpacity(0.7),
    ),
  ),
  scaffoldBackgroundColor: Colors.grey.shade900,
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white, size: 26),
    backgroundColor: Colors.grey.shade900,
    foregroundColor: Colors.grey.shade900,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade900,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: GoogleFonts.inter(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade800,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey.shade900,
    elevation: 20,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(primary: Colors.white),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.inter(
        color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
    displaySmall: GoogleFonts.inter(
        color: Colors.black45, fontSize: 15, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.inter(color: Colors.black, fontSize: 20,fontWeight:FontWeight.w500),
    bodySmall: GoogleFonts.inter(color: Colors.black, fontSize: 15,fontWeight:FontWeight.w500),
    labelMedium: GoogleFonts.inter(
      color: Colors.black45,
      fontSize: 16,
    ),
    labelLarge: GoogleFonts.inter(
        fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black54),
  ),
  scaffoldBackgroundColor: const Color(0xFFF7F7F7),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.black, size: 26),
    backgroundColor: const Color(0xFFF7F7F7),
    elevation: 0.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF7F7F7),
        statusBarIconBrightness: Brightness.dark),
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
