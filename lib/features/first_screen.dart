import 'package:flutter/material.dart';
import 'package:travego/features/layout.dart';
import '../core/utils/network/local/cacheHelper.dart';
import '../core/utils/shared/constant.dart';
import 'auth/presentation/views/login_screen.dart';

class FirstScreen extends StatelessWidget {
  late Widget widget;

 FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if(CacheHelper.getData(key: 'token') != null) {
      token = CacheHelper.getData(key: 'token');
    }

    if (token == '') {
      widget = const LoginScreen();
    } else {
      widget = const LoginScreen();
    }
    return widget;
  }
}
