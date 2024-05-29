import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DefaultElevated extends StatelessWidget {
  DefaultElevated({
    required this.label,
    required this.fill,
    super.key,
    required this.onPressed,
  });
  String label;
  bool fill;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: fill ? const Color.fromRGBO(0, 143, 160, 1) : null,
          side: const BorderSide(color: Color.fromRGBO(0, 143, 160, 1))),
      child: Center(
          child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: !fill ? const Color.fromRGBO(0, 143, 160, 1) : Colors.white,
        ),
      )),
    );
  }
}
