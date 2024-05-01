import 'package:flutter/material.dart';

Color defaultColor = const Color.fromRGBO(0, 143, 160, 1);
Widget defaultTextField({
  required TextEditingController controller,
  Widget? prefix,
  Widget? suffix,
  TextInputType? inputType,
  Function(String val)? onChanged,
  dynamic validator,
  String label = '',
}) {
  return TextFormField(
      validator: validator,
      keyboardType: inputType,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        label: label != ''
            ? Text(
                label,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.grey),
              )
            : null,
        prefixIcon: prefix,
        suffix: suffix,
        border: const UnderlineInputBorder(borderSide: BorderSide(width: .4)),
      ));
}

// ignore: non_constant_identifier_names
Widget PersonCard() => const Card();

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);
