
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

GestureDetector settingsSwitchItem({
  required Icon icon,
  context,
  required String label,
  switchFunction,
  required bool switchValue,
}) {
  return GestureDetector(
    // onTap: function,
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
          CupertinoSwitch(value: switchValue, onChanged: switchFunction),
        ],
      ),
    ),
  );
}