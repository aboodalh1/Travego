import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';
import 'package:travego/features/Settings/presentation/views/passengers/passenger_passport_screen.dart';
import 'package:travego/features/Settings/presentation/views/passengers/passenger_personal_id_screen.dart';
import 'package:travego/features/Settings/presentation/views/passengers/passenger_visa_screen.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo_impl.dart';

import '../../utils/shared/constant.dart';

class PassengerCard extends StatefulWidget {
  final String passengerFirstName;
  final String passengerLastName;
  final String fatherName;
  final String motherName;
  final String passengerGender;
  final String birthDate;
  final num? id;

  PassengerCard({
    super.key,
    this.id,
    required this.passengerFirstName,
    required this.passengerLastName,
    required this.fatherName,
    required this.motherName,
    required this.passengerGender,
    required this.birthDate,
  });

  @override
  State<PassengerCard> createState() => _PassengerCardState();
}

class _PassengerCardState extends State<PassengerCard> {


  TextEditingController passengerFirstNameCont = TextEditingController();
  TextEditingController passengerLastNameCont = TextEditingController();
  TextEditingController fatherNameCont = TextEditingController();
  TextEditingController motherNameCont = TextEditingController();
  TextEditingController passengerGenderCont = TextEditingController();
  TextEditingController birthDateCont = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => PassengerCubit(getIt.get<PassengersRepoImpl>()),
      child: BlocConsumer<PassengerCubit, PassengerStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          PassengerCubit passengerCubit = BlocProvider.of<PassengerCubit>(context);
          passengerFirstNameCont.text = widget.passengerFirstName;
          passengerLastNameCont.text = widget.passengerLastName;
          fatherNameCont.text = widget.fatherName;
          motherNameCont.text = widget.motherName;
          passengerGenderCont.text = widget.passengerGender;
          birthDateCont.text = widget.birthDate;
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
                        title: defaultInputTextField(passengerCubit: passengerCubit,
                          hintText: 'First Name',
                          controller: passengerFirstNameCont,
                          context,
                          textInputType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: passengerCubit.editIcon,
                          onPressed: () {
                            passengerCubit.isConfirm
                                ? setState(() {
                              passengerCubit.editOrConfirm(

                              );
                                })
                                : setState(() {
                              passengerCubit.confirmEditPassenger(
                                context,
                                passengerCubit.isConfirm,
                                id:  widget.id!,
                                fatherName: fatherNameCont.text,
                                motherName: motherNameCont.text,
                                firstName: passengerFirstNameCont.text,
                                lastName: passengerLastNameCont.text,
                                passengerGender: passengerGenderCont.text,
                                birthDate: birthDateCont.text,
                              );
                              passengerCubit.editOrConfirm();

                            });},
                        ),
                        PopupMenuButton<int>(
                          onSelected: (item) => _onSelected(context, item),
                          itemBuilder: (context) =>
                          [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Text('Edit Personal ID',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                  )),
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
                        child: defaultInputTextField(passengerCubit: passengerCubit,
                          controller: passengerLastNameCont,
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
                      Expanded(
                          child: defaultInputTextField(passengerCubit: passengerCubit,context,
                              controller: fatherNameCont)),
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
                          child: defaultInputTextField(passengerCubit: passengerCubit,context,
                              controller: motherNameCont)),
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
                        child: defaultInputTextField(passengerCubit: passengerCubit,
                          controller: passengerGenderCont,
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
                        child: defaultInputTextField(
                          passengerCubit: passengerCubit,
                          controller: birthDateCont,
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
      ),
    );
  }

  void _onSelected(BuildContext context, int item) {
    final passengerCubit = BlocProvider.of<PassengerCubit>(context);
    switch (item) {
      case 0:
        passengerCubit.getPassengerPersonalId(token: token, id: widget.id!);
        showDialog(
            context: context,
            builder: (context) =>  PassengerPersonalIdScreen(
              id: widget.id!,
              name: widget.passengerFirstName,
            ));
        break;
      case 1:
        showDialog(
            context: context,
            builder: (context) =>  PassengerPassportScreen(id: widget.id!,passengerName: widget.passengerFirstName, ));

        break;
      case 2:
        showDialog(
            context: context,
            builder: (context) =>  PassengerVisaScreen(
              id: widget.id!,
              name: widget.passengerFirstName,
            ));

        break;
      case 3:
        passengerCubit.removePassenger(token: token, id: widget.id!);
        break;
    }
  }

  Container defaultInputTextField(BuildContext context,
      {TextInputType? textInputType,
        String? hintText,
        Function()? onTap,
        required TextEditingController controller,
        required PassengerCubit passengerCubit
      }) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: BorderDirectional(
            bottom: !passengerCubit.isConfirm ? const BorderSide(width: 1) : BorderSide.none,
          ),
        ),
        child: TextFormField(
          controller: controller,
          onTap: onTap,
          enabled: !passengerCubit.isConfirm,
          keyboardType: textInputType,
          style: GoogleFonts.inter(
            fontSize: 15,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 15)),
        ),
      );
}
