import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/parsonnes_information/personnes_cubit/person_state.dart';

import '../../../model/user_information.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(PersonInit());
  static PersonCubit get(context) => BlocProvider.of(context);
  int personNumber = 1;

  final TextEditingController personFirstName = TextEditingController();
  final TextEditingController personLastName = TextEditingController();
  final TextEditingController personEmail = TextEditingController();
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController passportNumber = TextEditingController();
  final TextEditingController additionalPassport = TextEditingController();
  List<UserInformation> personnes = [];
  bool editOrConfirm = false;

  void addPerson() {
    personNumber += 1;
    emit(AddPerson());
  }

  void removePerson() {
    if (personNumber > 1) personNumber -= 1;
    print(personNumber);
    emit(RemovePerson());
  }
}
