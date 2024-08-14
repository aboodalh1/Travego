import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
void showToast({
  required String text,
  required ToastStates state,
})=>   Fluttertoast.showToast(
    msg: text ,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: chooseToastColor(state: state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastStates { SUCCESS, ERROR, WARNING }
Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = defaultColor;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}