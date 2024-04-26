import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/shared/components/components.dart';

class deafultCircleTextField extends StatelessWidget {
  const deafultCircleTextField({
    super.key,
    required this.usernameController,
    required this.prefix,
    required this.fill,
    required this.secure,
  });

  final TextEditingController usernameController;
  final Icon prefix;
  final bool fill;
  final bool secure;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: secure,
      controller: usernameController,
      prefix: Padding(
        padding: const EdgeInsets.all(8.0),
        child: prefix,
      ),
      style: TextStyle(color: fill ? Colors.white : Colors.black),
      decoration: BoxDecoration(
          color: fill ? defaultColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: defaultColor)),
    );
  }
}
