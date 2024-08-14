
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

GestureDetector settingsItem(
    {required Icon icon,
      required String label,
      required void Function() function}) {
  return GestureDetector(
    onTap: function,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 30,
          ),
          Text(label,
              style:
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    ),
  );
}
