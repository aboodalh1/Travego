
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/screen_size_util.dart';
import '../../utils/shared/components/components.dart';

class ErrorLoadingScreen extends StatelessWidget {
  const ErrorLoadingScreen(
      {
    super.key,
    required this.centerTitle,
    required this.appBarTitle,
    required this.buttonTitle,
    required this.onButtonPressed,
    required this.refreshFunction,
      });


  final String centerTitle;
  final String appBarTitle;
  final String buttonTitle;
  final VoidCallback onButtonPressed;
  final RefreshCallback refreshFunction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle.tr()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: defaultColor,
            onRefresh: refreshFunction,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSizeUtil.screenHeight * 0.4,
                    horizontal: ScreenSizeUtil.screenWidth * 0.25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(centerTitle),
                    TextButton(
                      onPressed: onButtonPressed,
                      child: Text(
                        buttonTitle,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
