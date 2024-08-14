import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/shared/components/components.dart';

class defaultCircleTextField extends StatelessWidget {
  const defaultCircleTextField({
    this.isEnabled,
    this.suffix,
    this.keyboardType,
    this.cursorColor,
    this.hintText,
    this.prefix,
    this.function,
    this.tapFunction,

    super.key,
    required this.controller,
    required this.fill,
    required this.secure,

  });
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Icon? prefix;
  final Function(String)? function;
  final GestureTapCallback? tapFunction;
  final bool fill;
  final Color ?cursorColor;
  final bool secure;
  final bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: secure,
      onChanged: function ,
      onTap: tapFunction,
      controller: controller,
      enabled: isEnabled ?? true,
      prefix: Padding(
        padding: const EdgeInsets.all(8.0),
        child: prefix,
      ),
      suffix: suffix ,
      cursorColor: cursorColor,
      keyboardType: keyboardType,
      placeholder: hintText,
      placeholderStyle: TextStyle(fontSize: 15,color: fill? Colors.white38 : Colors.grey),
      style: TextStyle(color: fill ? Colors.white : Colors.black),
      decoration: BoxDecoration(
          color: fill ? defaultColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: defaultColor)),
    );
  }
}
