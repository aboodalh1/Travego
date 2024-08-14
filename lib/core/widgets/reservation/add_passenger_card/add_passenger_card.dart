import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import 'package:travego/features/reservation/presentation/view/passenger/passenger_passport_reserve.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo_impl.dart';

import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/widgets/default_input_textfield/default_input_text_field.dart';
import '../../../../features/reservation/presentation/view/passenger/passenger_visa_reserve.dart';
import '../../../utils/network/remote/service_locator.dart';

class AddPassengerCardToReserve extends StatelessWidget {
  const AddPassengerCardToReserve({super.key,required this.reserveTripCubit});

  final ReserveTripCubit reserveTripCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveTripCubit(getIt.get<ReserveTripRepoImpl>()),
      child: BlocConsumer<ReserveTripCubit, ReserveTripState>(
        listener: (context, state) {
            // if (state is AddPassengerSuccess) {
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //       content: Text('Passenger added successfully')));
            //   Navigator.pop(context);
            // }
        },
        builder: (context, ReserveTripState state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add passenger"),
            ),
            body: Form(
              key: reserveTripCubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
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
                                    child:
                                    Image.asset("assets/images/cover.png"),
                                  ),
                                  title: defaultInputTextField(
                                    hintText: 'First Name',
                                    controller: reserveTripCubit.firstNameController,
                                    context,
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                ),
                              ),
                              PopupMenuButton<int>(
                                onSelected: (item) => _onSelected(context, item,reserveTripCubit),
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
                          Divider(
                            thickness: 1,
                            height: 5,
                            color: defaultColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Last name:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: defaultInputTextField(
                                    controller: reserveTripCubit.lastNameController,
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
                                    child: defaultInputTextField(context,
                                        controller: reserveTripCubit.fatherNameController)),
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
                                    child: defaultInputTextField(context,
                                        controller: reserveTripCubit.motherNameController)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  "Nationality: ".tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: defaultInputTextField(
                                    controller: reserveTripCubit.nationalityController,
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
                                    controller: reserveTripCubit.birthDateController,
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
                    ),
                    DefaultElevated(
                        label: 'Add',
                        fill: false,
                        onPressed: () {
                          if(reserveTripCubit.formKey.currentState!.validate()) {
                            reserveTripCubit.addPersonnes();
                          }
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void _onSelected(BuildContext context, int item, ReserveTripCubit reserveCubit) {

  switch (item) {
    case 0:

      break;
    case 1:
      showDialog(
          context: context,
          builder: (context) =>   PassengerPassportReserve(reserveTripCubit: reserveCubit,));

      break;
    case 2:
      showDialog(
          context: context,
          builder: (context) =>   PassengerVisaReserve(reserveTripCubit: reserveCubit,));

      break;
    case 3:
      reserveCubit.removePassenger();
      break;
  }
}
