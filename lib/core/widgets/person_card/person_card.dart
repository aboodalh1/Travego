import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/parsonnes_information/personnes_cubit/person_cubit.dart';
import 'package:travego/model/user_information.dart';

import '../../../features/parsonnes_information/personnes_cubit/person_state.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({super.key});

  @override
  Widget build(BuildContext context) {
    var horizontalPadding = MediaQuery.of(context).size.width;
    var verticalPadding = MediaQuery.of(context).size.height;
    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: horizontalPadding,
          height: verticalPadding * .45,
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
                        child: Image.asset("assets/images/lakes.png"),
                      ),
                      title: const Text(
                        'Kareem alMosafi',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon:
                            BlocProvider.of<PersonCubit>(context).editOrConfirm
                                ? const Icon(Icons.done)
                                : const Icon(Icons.edit),
                        onPressed: () {
                          BlocProvider.of<PersonCubit>(context).editOrConfirm =
                              !BlocProvider.of<PersonCubit>(context)
                                  .editOrConfirm;
                          if (BlocProvider.of<PersonCubit>(context)
                                  .editOrConfirm ==
                              true) {
                            BlocProvider.of<PersonCubit>(context).personnes.add(
                                UserInformation(
                                    firstName:
                                        BlocProvider.of<PersonCubit>(context)
                                            .personFirstName
                                            .text,
                                    lastName:
                                        BlocProvider.of<PersonCubit>(context)
                                            .personLastName
                                            .text,
                                    motherName:
                                        BlocProvider.of<PersonCubit>(context)
                                            .motherName
                                            .text,
                                    email: BlocProvider.of<PersonCubit>(context)
                                        .personEmail
                                        .text,
                                    fatherName:
                                        BlocProvider.of<PersonCubit>(context)
                                            .fatherName
                                            .text,
                                    passport:
                                        BlocProvider.of<PersonCubit>(context)
                                            .passportNumber
                                            .text));
                            BlocProvider.of<PersonCubit>(context)
                                .personFirstName
                                .clear();
                            BlocProvider.of<PersonCubit>(context)
                                .personLastName
                                .clear();
                            BlocProvider.of<PersonCubit>(context)
                                .personEmail
                                .clear();
                            BlocProvider.of<PersonCubit>(context)
                                .fatherName
                                .clear();
                            BlocProvider.of<PersonCubit>(context)
                                .motherName
                                .clear();
                            BlocProvider.of<PersonCubit>(context)
                                .passportNumber
                                .clear();
                            BlocProvider.of<PersonCubit>(context)
                                .additionalPassport
                                .clear();
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<PersonCubit>(context).removePerson();
                          print(BlocProvider.of<PersonCubit>(context)
                              .personNumber);
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
                      "Email:".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: DefaultInputTextField())
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
                    Expanded(child: DefaultInputTextField())
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
                    Expanded(child: DefaultInputTextField())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      "passport number: ".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: DefaultInputTextField())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      "additional passport: ".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: DefaultInputTextField())
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container DefaultInputTextField() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: const BoxDecoration(
          border: BorderDirectional(bottom: BorderSide(width: 1))),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
}
