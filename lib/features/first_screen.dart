import 'package:flutter/material.dart';
import 'package:travego/features/layout.dart';

import '../core/utils/shared/constant.dart';
import 'auth/views/login_screen.dart';

// ignore: must_be_immutable
class FirstScreen extends StatelessWidget {
  late Widget widget;

  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      widget = LoginScreen();
    } else {
      widget = LayoutScreen();
      print(token);
    }
    return widget;
  }
}
