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
    PersonCubit cubit = PersonCubit.get(context);
    var horizontalPadding = MediaQuery.of(context).size.width;
    var verticalPadding = MediaQuery.of(context).size.height;
    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: horizontalPadding,
          height: verticalPadding * .4,
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
                        icon: cubit.editOrConfirm
                            ? const Icon(Icons.done)
                            : const Icon(Icons.edit),
                        onPressed: () {
                          cubit.editOrConfirm = !cubit.editOrConfirm;
                          if (cubit.editOrConfirm == true) {
                            cubit.personnes.add(UserInformation(
                                firstName: cubit.personFirstName.text,
                                lastName: cubit.personLastName.text,
                                motherName: cubit.motherName.text,
                                email: cubit.personEmail.text,
                                fatherName: cubit.fatherName.text,
                                passport: cubit.passportNumber.text));
                            cubit.personFirstName.clear();
                            cubit.personLastName.clear();
                            cubit.personEmail.clear();
                            cubit.fatherName.clear();
                            cubit.motherName.clear();
                            cubit.passportNumber.clear();
                            cubit.additionalPassport.clear();
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cubit.removePerson();
                          print(cubit.personNumber);
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
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Email:".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "father name: khaled".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // // 5 //----------------------
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "mother name: none".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "passport number: 1354234".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "additional passport: none".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
