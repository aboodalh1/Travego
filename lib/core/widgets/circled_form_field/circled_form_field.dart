import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/shared/components/components.dart';

class defaultCircleTextField extends StatelessWidget {
  const defaultCircleTextField({
    this.isEnabled,
    this.suffix,
    this.keyboardType,
    this.hintText,
    super.key,
    required this.controller,
    required this.prefix,
    required this.fill,
    required this.secure,
  });
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Icon prefix;
  final bool fill;
  final bool secure;
  final bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: secure,
      controller: controller,
      enabled: isEnabled ?? true,
      prefix: Padding(
        padding: const EdgeInsets.all(8.0),
        child: prefix,
      ),
      suffix: suffix ?? null,
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
