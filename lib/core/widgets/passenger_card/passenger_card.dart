import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';
import 'package:travego/features/Settings/presentation/views/passengers/passenger_passport_screen.dart';
import 'package:travego/features/Settings/presentation/views/passengers/passenger_personal_id_screen.dart';
import 'package:travego/features/Settings/presentation/views/passengers/passenger_visa_screen.dart';

class PassengerCard extends StatelessWidget {
  const PassengerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final passengerCubit = BlocProvider.of<PassengerCubit>(context);

    return BlocConsumer<PassengerCubit, PassengerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: ScreenSizeUtil.screenWidth,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: defaultColor,
            ),
            color: defaultColor.withOpacity(.3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.asset("assets/images/cover.png"),
                      ),
                      title: DefaultInputTextField(
                        hintText: 'First Name',
                        controller: passengerCubit.passengerLastName,
                        context,
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: passengerCubit.isConfirm
                            ? const Icon(Icons.done)
                            : const Icon(Icons.edit),
                        onPressed: () {
                          passengerCubit.isConfirm
                              ? passengerCubit.editPassenger()
                              : passengerCubit.confirmPassenger(context);
                        },
                      ),
                      PopupMenuButton<int>(
                        onSelected: (item) => _onSelected(context, item),
                        itemBuilder: (context) =>
                        [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Text(
                                'Edit Personal ID',
                                style: GoogleFonts.inter(
                                  fontSize: 14,)
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(
                              'Edit Passport',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(
                              'Edit Visa',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(
                              'Delete passenger',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 5,
                color: defaultColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      "Last name:".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: DefaultInputTextField(
                        controller: passengerCubit.passengerLastName,
                        context,
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      "father name: ".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: DefaultInputTextField(
                        context, controller: passengerCubit.fatherName)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      "mother name: ".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                        child: DefaultInputTextField(
                            context, controller: passengerCubit.motherName)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      "Gender: ".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: DefaultInputTextField(
                        controller: passengerCubit.passengerGender,
                        context,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      "Birth date: ".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: DefaultInputTextField(
                        controller: passengerCubit.birthDate,
                        context,
                        onTap: () {
                          showDatePicker(
                              context: context,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2030));
                        },
                        textInputType: TextInputType.datetime,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onSelected(BuildContext context, int item) {
    final passengerCubit = BlocProvider.of<PassengerCubit>(context);
    switch (item) {
      case 0:
        showDialog(context: context,
            builder: (context) => const PassengerPersonalIdScreen());
        break;
      case 1:
        showDialog(context: context,
            builder: (context) => const PassengerPassportScreen());
        break;
      case 2:
        showDialog(context: context,
            builder: (context) => const PassengerVisaScreen());

        break;
      case 3:
        passengerCubit.removePassenger();
        break;
    }
  }

  Container DefaultInputTextField(BuildContext context,
      {TextInputType? textInputType, String ? hintText, Function()? onTap, required TextEditingController controller}) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: BorderDirectional(
            bottom: BlocProvider
                .of<PassengerCubit>(context)
                .isConfirm
                ? const BorderSide(width: 1)
                : BorderSide.none,
          ),
        ),
        child: TextFormField(

          controller: controller,
          onTap: onTap,
          enabled: BlocProvider
              .of<PassengerCubit>(context)
              .isConfirm,
          keyboardType: textInputType,
          style: GoogleFonts.inter(
            fontSize: 15,
          ),
          decoration:  InputDecoration(

            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 15)
          ),
        ),
      );
}
