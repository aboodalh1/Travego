// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:travego/view/auth/login_screen.dart';
import 'package:travego/view/navigation_bar_items/Settings/LanguageScreen/LanguageScreen.dart';
import 'package:travego/view/navigation_bar_items/Settings/edit_profile/edit_profile_screen.dart';

import '../../../core/utils/shared/components/components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final height = mediaQueryData.size.height;
    final width = mediaQueryData.size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.35,
              decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                      ),
                      color: Colors.white,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        navigateAndFinish(context, LoginScreen());
                      },
                      icon: const Icon(
                        Icons.logout_outlined,
                        size: 30,
                      ),
                      color: Colors.white,
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .35, vertical: height * .08),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/cover.png',
                    scale: 4.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'MRMR',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250, right: 20, left: 20),
              child: Container(
                  height: height * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Account'.tr,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          settingsItem(
                            function: () {
                              navigateTo(context, EditProfileScreen());
                            },
                            icon: const Icon(
                                CupertinoIcons.person_crop_circle_fill),
                            label: 'Edit profile'.tr,
                          ),
                          settingsItem(
                              function: () {},
                              icon: const Icon(CupertinoIcons.lock_fill),
                              label: 'Privacy'.tr),
                          settingsItem(
                              function: () {},
                              icon: const Icon(CupertinoIcons.shield),
                              label: 'Security'.tr),
                          settingsItem(
                              function: () {
                                navigateTo(context, LanguageScreen());
                              },
                              icon: const Icon(Icons.translate),
                              label: 'Language'.tr),
                          settingsItem(
                              function: () {},
                              icon: const Icon(CupertinoIcons.bell_solid),
                              isSwitch: true,
                              label: 'Notification'.tr),
                          settingsItem(
                              function: () {},
                              icon: const Icon(CupertinoIcons.moon_fill),
                              isSwitch: true,
                              label: 'Dark mode'.tr),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            'About & Support'.tr,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          settingsItem(
                              function: () {},
                              icon: const Icon(
                                  CupertinoIcons.exclamationmark_circle_fill),
                              label: 'Help & Support'.tr),
                          settingsItem(
                              function: () {},
                              icon: const Icon(
                                  CupertinoIcons.question_circle_fill),
                              isSwitch: false,
                              label: 'Terms and Policies'.tr),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            'Actions'.tr,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: Row(
                                children: [
                                  Text('delete my account'.tr,
                                      style: GoogleFonts.inter(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector settingsItem(
      {required Icon icon,
      required String label,
      bool isSwitch = false,
      required void function()}) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 30,
            ),
            Text(label,
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            isSwitch
                ? CupertinoSwitch(
                    value: false,
                    onChanged: (bool value) {},
                  )
                : const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
