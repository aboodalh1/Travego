
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/shared/components/components.dart';

Expanded defaultInputTextField(BuildContext context,
    {TextInputType? textInputType,
      String? hintText,
      Function()? onTap,
      required TextEditingController controller}) =>
    Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        height: 40,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        border: Border.all(color: defaultColor,strokeAlign: 2),
        ),
        child: TextFormField(
          validator: (val) {
            if(val!.isEmpty){
              return '';
            }
            return null;
          },
          controller: controller,
          onTap: onTap,
          keyboardType: textInputType,
          style: GoogleFonts.inter(
            fontSize: 15,
          ),
          cursorColor: defaultColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 15)),
        ),
      ),
    );

