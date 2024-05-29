import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo_impl.dart';

import '../../../../../model/user_information.dart';
import '../../../repo/passengers_repo/passengers_repo.dart';

part 'passenger_state.dart';

class PassengerCubit extends Cubit<PassengerStates> {
  PassengerCubit(this.passengersRepo) : super(PassengerInit());
  PassengersRepo passengersRepo;
  int personNumber = 1;
  DateTime dateController = DateUtils.dateOnly(DateTime.now());
  DateTime dateController2 = DateUtils.dateOnly(DateTime.parse('2030-02-01'));

  final TextEditingController passengerFirstName = TextEditingController();
  final TextEditingController passengerLastName = TextEditingController();
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController passengerGender = TextEditingController();
  final TextEditingController birthDate = TextEditingController();



  final TextEditingController passportFirstName = TextEditingController();
  final TextEditingController passportLastName = TextEditingController();
  final TextEditingController passportIssueDate = TextEditingController();
  final TextEditingController passportExpiredDate = TextEditingController();
  final TextEditingController passportNumber = TextEditingController();


  final TextEditingController visaType = TextEditingController();
  final TextEditingController visaCountry = TextEditingController();
  final TextEditingController visaIssueDate = TextEditingController();
  final TextEditingController visaExpiredDate = TextEditingController();


  final TextEditingController idFirstName = TextEditingController();
  final TextEditingController idLastName = TextEditingController();
  final TextEditingController idBirthDate = TextEditingController();
  final TextEditingController idNationality = TextEditingController();



  List<UserInformation> personnes = [];
  bool isConfirm = false;
  bool addPersons = false;
  void addPassenger() {
    personNumber += 1;
    emit(AddPassenger());
  }

  Future<void> confirmPassenger(context) async{
    isConfirm = true;
    emit(ConfirmPassenger());

    if (isConfirm == true) {
      DateTime birthDateFormatted = DateTime.parse(birthDate.text);
      var result =await passengersRepo.addPassenger(
          firstName: passengerFirstName.text,
          lastName: passengerLastName.text,
          motherName: motherName.text,
          gender: passengerGender.text,
          fatherName: fatherName.text,
          birthDate: birthDateFormatted, token: token);
      result.fold((failure) {
        emit(PassengersErrorState(error: failure.errMessage));
      }, (message) {
        emit(AddPassengerSuccess(message: message));
        passengerFirstName.clear();
        passengerLastName.clear();
        passengerGender.clear();
        fatherName.clear();
        motherName.clear();
        birthDate.clear();
      });

    }
  }

  editPassenger() {
    isConfirm = false;
    emit(EditPassenger());
  }

  void removePassenger() {
    if (personNumber > 1) personNumber -= 1;
    emit(RemovePassenger());
  }


}
