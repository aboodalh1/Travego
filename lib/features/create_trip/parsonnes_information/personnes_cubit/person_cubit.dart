import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/user_information.dart';
part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(PersonInit());
  int personNumber = 1;
  final TextEditingController searchController = TextEditingController();
  DateTime dateController = DateUtils.dateOnly(DateTime.now());
  DateTime dateController2 = DateUtils.dateOnly(DateTime.parse('2030-02-01'));

  final TextEditingController personFirstName = TextEditingController();
  final TextEditingController personLastName = TextEditingController();
  final TextEditingController personEmail = TextEditingController();
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController passportNumber = TextEditingController();
  final TextEditingController additionalPassport = TextEditingController();
  List<UserInformation> personnes = [];
  bool isConfirm = false;
  bool addPersons = false;
  void addPerson() {
    personNumber += 1;
    emit(AddPerson());
  }

  void confirmPerson() {
    isConfirm = true;
    emit(ConfirmPerson());

    if (isConfirm == true) {
      personnes.add(UserInformation(
          firstName: personFirstName.text,
          lastName: personLastName.text,
          motherName: motherName.text,
          email: personEmail.text,
          fatherName: fatherName.text,
          birthDate: passportNumber.text));

      personFirstName.clear();
      personLastName.clear();
      personEmail.clear();
      fatherName.clear();
      motherName.clear();
      passportNumber.clear();
      additionalPassport.clear();
    }
  }

  editPerson() {
    isConfirm = false;
    emit(EditPerson());
  }

  void removePerson() {
    if (personNumber > 1) personNumber -= 1;
    emit(RemovePerson());
  }

  void transitionNavigation(){
    addPersons = true;
    emit(AddPersonsScreen());
  }
}
