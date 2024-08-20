import 'package:flutter/material.dart';
void customSnackBar(context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsetsDirectional.all(10),


    ),
  );
}