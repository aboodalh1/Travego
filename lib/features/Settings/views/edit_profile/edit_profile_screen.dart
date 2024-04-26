import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  GlobalKey formKey = GlobalKey<FormState>();
  EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F7F7),
        title: Text(
          'Edit profile information'.tr,
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
