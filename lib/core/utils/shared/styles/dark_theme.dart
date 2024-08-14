
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.inter(color: Colors.white, fontSize: 12,fontWeight:FontWeight.w500),
    bodySmall: GoogleFonts.inter(color: Colors.white, fontSize: 10,fontWeight:FontWeight.w500),
    labelSmall: GoogleFonts.inter(
        color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
    displaySmall: GoogleFonts.inter(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.inter(
      color: Colors.white,
      fontSize: 16,
    ),
    labelLarge: GoogleFonts.inter(
        fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
    headlineMedium: GoogleFonts.inter(
        fontSize: 13, fontWeight: FontWeight.w600,color: Colors.white),
    headlineLarge: GoogleFonts.inter(
        fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
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
    // titleTextStyle: GoogleFonts.inter(
    //   color: Colors.white,
    //   fontSize: 20.0,
    //   fontWeight: FontWeight.bold,
    // ),
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
