
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container defaultInputTextField(BuildContext context,
    {TextInputType? textInputType,
      String? hintText,
      Function()? onTap,
      required TextEditingController controller}) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: const BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(width: 1),
        ),
      ),
      child: TextFormField(
        validator: (val) {
          if(val!.isEmpty){
            return 'this field is required';
          }
          return null;
        },
        controller: controller,
        onTap: onTap,
        keyboardType: textInputType,
        style: GoogleFonts.inter(
          fontSize: 15,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 15)),
      ),
    );

