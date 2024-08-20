import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/shared/Widgets/default_button.dart';
import '../../../../../core/widgets/default_input_textfield/default_input_text_field.dart';
import '../../manger/reserve_trip_cubit.dart';
import '../widgets/image_widget.dart';

class AdditionalPassengerReserveCard extends StatelessWidget {
  const AdditionalPassengerReserveCard(
      {super.key, required this.reserveTripCubit});

  final ReserveTripCubit reserveTripCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAdditionalPassengerField(
                title: "First name: ",
                controller: reserveTripCubit.firstNameController),
            CustomAdditionalPassengerField(
                title: "Last name: ",
                controller: reserveTripCubit.lastNameController),
            CustomAdditionalPassengerField(
                title: "Father name: ",
                controller: reserveTripCubit.fatherNameController),
            CustomAdditionalPassengerField(
                title: "Mother name: ",
                controller: reserveTripCubit.motherNameController),
            CustomAdditionalPassengerField(
                title: "Nationality: ",
                controller: reserveTripCubit.nationalityController),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const CustomText(title: 'Birth Date'),
                defaultInputTextField(
                  context,
                  controller: reserveTripCubit.birthDateController,
                  onTap: ()async{
                   final DateTime? picked = await showDatePicker(
                       context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(1900),
                       lastDate: DateTime(2040),
                   );
                   if(picked!=null){ reserveTripCubit.birthDateController.text =
                       DateFormat('yyyy-MM-dd').format(picked);}
                  },
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
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
                      image: reserveTripCubit.personalIdImage!,
                      controller: reserveTripCubit.personalIdImageController),
                  label: 'Camera',
                  fill: false,
                ),
                DefaultElevated(
                  onPressed: () => reserveTripCubit.pickImage(
                      source: ImageSource.gallery,
                      image: reserveTripCubit.personalIdImage!,
                      controller: reserveTripCubit.personalIdImageController),
                  label: 'Gallery',
                  fill: false,
                ),
              ],
            ),
            if (reserveTripCubit.personalIdImage != null)
              Center(
                child: ImageWidget(

                  controller: reserveTripCubit.personalIdImageController,
                  reserveTripCubit: reserveTripCubit,
                  image: reserveTripCubit.personalIdImage!,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CustomAdditionalPassengerField extends StatelessWidget {
 const  CustomAdditionalPassengerField({
    super.key,

    required this.title,
    required this.controller,
  });


  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CustomText(title: title),
          defaultInputTextField(
            controller: controller,

            context,
            textInputType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSizeUtil.screenWidth * 0.22,
      child: Text(
        title.tr(),
      ),
    );
  }
}
