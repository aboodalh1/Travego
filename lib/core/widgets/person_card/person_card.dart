import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/create_trip/parsonnes_information/personnes_cubit/person_cubit.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({super.key});

  @override
  Widget build(BuildContext context) {
    final personCubit = BlocProvider.of<PersonCubit>(context);

    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: ScreenSizeUtil.screenWidth,
          height: ScreenSizeUtil.screenHeight<340?ScreenSizeUtil.screenHeight * .40:340,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: defaultColor,
              ),
              color: defaultColor.withOpacity(.3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            // 1 //----------------------
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.asset("assets/images/cover.png"),
                      ),
                      title:  const Text(
                        'First Name',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: personCubit.isConfirm
                            ? const Icon(Icons.done)
                            : const Icon(Icons.edit),
                        onPressed: () {
                          personCubit.isConfirm
                              ? personCubit
                                  .editPerson()
                              : personCubit
                                  .confirmPerson();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          personCubit.removePerson();
                        },
                      ),
                    ],
                  )
                ],
              ),
              // 2 //----------------------
              Divider(
                thickness: 1,
                height: 5,
                color: defaultColor,
              ),
              // 3 //----------------------

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
                    Expanded(child: DefaultInputTextField(context,
                    textInputType: TextInputType.emailAddress))
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
                    Expanded(child: DefaultInputTextField(context))
                  ],
                ),
              ),
              // // 5 //----------------------
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
                    Expanded(child: DefaultInputTextField(context))
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
                        child: DefaultInputTextField(context,
                            textInputType: TextInputType.number))
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
                        child: DefaultInputTextField(context,
                            textInputType: TextInputType.number))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container DefaultInputTextField(context, {TextInputType? textInputType}) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
            border: BorderDirectional(
                bottom: BlocProvider.of<PersonCubit>(context).isConfirm
                    ? BorderSide(width: 1)
                    : BorderSide.none)),
        child: TextFormField(
          enabled: BlocProvider.of<PersonCubit>(context).isConfirm,
          keyboardType: textInputType,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      );
}
