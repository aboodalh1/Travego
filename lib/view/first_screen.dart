import 'package:flutter/material.dart';
import 'package:travego/shared/constant.dart';
import 'package:travego/view/auth/login_screen.dart';
import 'package:travego/view/layout.dart';

// ignore: must_be_immutable
class FirstScreen extends StatelessWidget {
  late Widget widget;

  FirstScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    if (token == null) {
      widget = LoginScreen();
    } 
    else {
      
      widget = LayoutScreen();
      print(token);
    }
    return widget;
  }
}
