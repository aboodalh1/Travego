import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../manger/auth_cubit.dart';

VerificationCode customVerificationCode(AuthCubit cubit, context) {
  return VerificationCode(
    itemSize: 40,
    digitsOnly: false,
    fullBorder: true,
    textStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
    keyboardType: TextInputType.text,
    underlineColor: Colors.amber,
    length: 6,
    cursorColor: Colors.blue,
    clearAll: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'clear all',
        style: TextStyle(fontSize: 14.0, color: Colors.blue[700]),
      ),
    ),
    pasteStream: cubit.pasteCode,
    onCompleted: (String value) {
      cubit.code = value;
      cubit.verifyCode(
          code: cubit.code.toString(), email: cubit.emailController.text);
    },
    onEditing: (bool value) {
      cubit.onEditing = value;
      if (!cubit.onEditing) {
        FocusScope.of(context).unfocus();
      }
    },
  );
}
