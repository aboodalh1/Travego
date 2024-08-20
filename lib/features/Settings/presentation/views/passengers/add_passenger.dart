import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo_impl.dart';

import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/widgets/default_input_textfield/default_input_text_field.dart';
import '../../../../../translations/locale_keys.g.dart';

class AddPassengerScreen extends StatelessWidget {
  AddPassengerScreen({super.key});

  TextEditingController passengerFirstNameCont = TextEditingController();

  TextEditingController passengerLastNameCont = TextEditingController();

  TextEditingController fatherNameCont = TextEditingController();

  TextEditingController motherNameCont = TextEditingController();

  TextEditingController passengerGenderCont = TextEditingController();

  TextEditingController birthDateCont = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PassengerCubit(getIt.get<PassengersRepoImpl>()),
        child: BlocConsumer<PassengerCubit, PassengerStates>(
          listener: (context, state) {
            if (state is AddPassengerSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Passenger added successfully')));
                   Navigator.pop(context);
            }
          },
          builder: (context, state) {

            return Form(
              key: _formKey,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Add passenger"),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  LocaleKeys.FirstName.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: defaultInputTextField(
                                    controller: passengerFirstNameCont,
                                    context,
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      Padding(
                        padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  LocaleKeys.LastName.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: defaultInputTextField(
                                    controller: passengerLastNameCont,
                                    context,
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  LocaleKeys.FatherName.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                    child: defaultInputTextField(context,
                                        controller: fatherNameCont)),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  LocaleKeys.MotherName.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                    child: defaultInputTextField(context,
                                        controller: motherNameCont)),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Gender: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: defaultInputTextField(
                                    controller: passengerGenderCont,
                                    context,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Birth date: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: defaultInputTextField(
                                    controller: birthDateCont,
                                    context,
                                    onTap: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                              initialDate: DateTime.now(),
                                              context: context,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2030));
                                      if(picked!=null){
                                        birthDateCont.text = DateFormat('yyyy-MM-dd').format(picked);
                                      }
                                    },
                                    textInputType: TextInputType.datetime,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DefaultElevated(
                            label: 'Add',
                            fill: false,
                            onPressed: () {
                              BlocProvider.of<PassengerCubit>(context)
                                  .addPassenger(
                                      firstName: passengerFirstNameCont.text,
                                      lastName: passengerLastNameCont.text,
                                      fatherName: fatherNameCont.text,
                                      motherName: motherNameCont.text,
                                      passengerGender: passengerGenderCont.text,
                                      birthDate: birthDateCont.text);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
