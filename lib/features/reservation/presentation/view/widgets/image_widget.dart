import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/utils/screen_size_util.dart';
import '../../manger/reserve_trip_cubit.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.reserveTripCubit,
    required this.image,
    required this.controller,
  });

  final ReserveTripCubit reserveTripCubit;
  final File image;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [

      ClipRRect(
        borderRadius: BorderRadius.circular(20),
          child: SizedBox(
              width: ScreenSizeUtil.screenWidth * 0.4,
              height: ScreenSizeUtil.screenHeight * 0.3,
              child: Image.file(image))),
      IconButton(
        icon: Container(
          width: ScreenSizeUtil.screenHeight*0.2,
          height: ScreenSizeUtil.screenHeight*0.05,
            margin: const EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            ),
            child: const Icon(
              Icons.cancel_rounded,
              color: Colors.white54,
            )),
        onPressed: () {
          reserveTripCubit.cancelPhoto(image: image,controller: controller);
        },
      ),
    ]);
  }
}
