import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/shared/Widgets/default_button.dart';
import '../widgets/image_widget.dart';

class PassengerVisaReserve extends StatelessWidget {
  const PassengerVisaReserve({super.key, required this.reserveTripCubit});

  final ReserveTripCubit reserveTripCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Visa',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Icon(FontAwesomeIcons.ccVisa, color: defaultColor),
              ],
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Visa type',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: reserveTripCubit.visaTypeController,
                      fill: false,
                      hintText: 'visa type',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Visa country',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: reserveTripCubit.visaCountryController,
                      fill: false,
                      hintText: 'Country',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Visa issue date',
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
                          reserveTripCubit.visaIssueDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      },
                      controller: reserveTripCubit.visaIssueDateController,
                      fill: false,
                      hintText: 'visa issue date',
                      secure: false),
                  const Gap(15),
                  const Text(
                    'Visa expired date',
                  ),
                  const Gap(5),
                  defaultCircleTextField(
                      controller: reserveTripCubit.visaExpiresDateController,
                      fill: false,
                      tapFunction: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101),
                        );

                        if (picked != null) {
                          reserveTripCubit.visaExpiresDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      },
                      hintText: 'visa expired date',
                      secure: false),
                  const Gap(10),
                  Text(
                    "Personal ID Photo",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultElevated(
                        onPressed: () => reserveTripCubit.pickImage(
                            source: ImageSource.camera,
                            image: reserveTripCubit.visaImage!,
                            controller: reserveTripCubit.visaImageController),
                        label: 'Camera',
                        fill: false,
                      ),
                      DefaultElevated(
                        onPressed: () => reserveTripCubit.pickImage(
                            source: ImageSource.gallery,
                            image: reserveTripCubit.visaImage!,
                            controller: reserveTripCubit.visaImageController),
                        label: 'Gallery',
                        fill: false,
                      ),
                    ],
                  ),
                  if (reserveTripCubit.visaImage != null)
                    Center(
                        child: ImageWidget(
                          reserveTripCubit: reserveTripCubit,
                          image: reserveTripCubit.visaImage!,
                          controller: reserveTripCubit.visaImageController,
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

