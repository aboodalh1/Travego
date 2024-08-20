import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import '../../../../../core/utils/shared/Widgets/default_button.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../widgets/image_widget.dart';

class PassengerPassportReserve extends StatelessWidget {
  const PassengerPassportReserve({super.key, required this.reserveTripCubit});

  final ReserveTripCubit reserveTripCubit;

  @override
  Widget build(BuildContext context) {
    return AddPassportWidget(
      reserveTripCubit: reserveTripCubit,
    );
  }
}

class AddPassportWidget extends StatelessWidget {
  const AddPassportWidget({super.key, required this.reserveTripCubit});

  final ReserveTripCubit reserveTripCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Passport',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Gap(10),
                Icon(FontAwesomeIcons.passport, color: defaultColor),
              ],
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Passport number',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: reserveTripCubit.passportNumberController,
                      fill: false,
                      hintText: 'Passport number',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Passport issue date',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      tapFunction: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101),
                        );

                        if (picked != null) {
                          reserveTripCubit.passportIssueDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      },
                      controller: reserveTripCubit.passportIssueDateController,
                      fill: false,
                      hintText: 'Passport issue date',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Passport expired date',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      tapFunction: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101),
                        );

                        if (picked != null) {
                          reserveTripCubit.passportExpiresDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      },
                      controller:
                          reserveTripCubit.passportExpiresDateController,
                      fill: false,
                      hintText: 'Passport expire date',
                      secure: false),
                  const Gap(10),
                  Text(
                    "Passport Photo",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultElevated(
                        onPressed: () => reserveTripCubit.pickImage(
                            source: ImageSource.camera,
                            image: reserveTripCubit.passportImage!,
                            controller:
                                reserveTripCubit.passportImageController),
                        label: 'Camera',
                        fill: false,
                      ),
                      DefaultElevated(
                        onPressed: () => reserveTripCubit.pickImage(
                            source: ImageSource.gallery,
                            image: reserveTripCubit.passportImage!,
                            controller:
                                reserveTripCubit.passportImageController),
                        label: 'Gallery',
                        fill: false,
                      ),
                    ],
                  ),
                  if (reserveTripCubit.personalIdImage != null)
                    Center(
                        child: ImageWidget(
                      reserveTripCubit: reserveTripCubit,
                      image: reserveTripCubit.passportImage!,
                      controller: reserveTripCubit.passportImageController,
                    ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
