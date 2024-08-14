
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/model/remote/passenger/passenger_info_model.dart';
import 'package:travego/model/remote/passenger/passenger_passport_model.dart';
import 'package:travego/model/remote/passenger/passenger_personal_id_model.dart';
import 'package:travego/model/remote/passenger/passenger_visa_model.dart';

import '../../../repo/passengers_repo/passengers_repo.dart';

part 'passenger_state.dart';

class PassengerCubit extends Cubit<PassengerStates> {
  PassengerCubit(this.passengersRepo) : super(PassengerInit());
  PassengersRepo passengersRepo;
  PassengerInfoModel? passengersModel;
  int personNumber = 1;
  bool isError = false;
  DateTime dateController = DateUtils.dateOnly(DateTime.now());
  DateTime dateController2 = DateUtils.dateOnly(DateTime.parse('2030-02-01'));

  bool isConfirm=true;
  Icon editIcon = const Icon(Icons.edit);
  void editOrConfirm(){
    isConfirm=!isConfirm;
    emit(EditOrConformState());
    editIcon = isConfirm ?  const Icon(Icons.edit): const Icon(Icons.done);

  }

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


  bool addPersons = false;

  void addPassenger({
    required String firstName,
    required String lastName,
    required String fatherName,
    required String motherName,
    required String passengerGender,
    required String birthDate,
  }) async {
    emit(GetPassengerLoading());


    var result = await passengersRepo.addPassenger(
        firstName: firstName,
        lastName: lastName,
        motherName: motherName,
        gender: passengerGender,
        fatherName: fatherName,
        birthDate: birthDate,
        token: token);
    result.fold((failure) {
      emit(PassengersErrorState(error: failure.errMessage));
    }, (message) {
      emit(AddPassengerSuccess(message: message));
    });
  }

  Future<void> confirmEditPassenger(context, isConfirm,
      {
        required String firstName,
        required String lastName,
        required String fatherName,
        required String motherName,
        required String passengerGender,
        required String birthDate,
        required num id,
      }) async {
    emit(GetPassengerLoading());

    emit(ConfirmPassenger());


    var result = await passengersRepo.editPassenger(
        id: id,
        firstName: firstName,
        lastName: lastName,
        motherName: motherName,
        gender: passengerGender,
        fatherName: fatherName,
        birthDate: birthDate,
        token: token);
    result.fold((failure) {
      emit(PassengersErrorState(error: failure.errMessage));
    }, (message) {
      emit(AddPassengerSuccess(message: message));
    });
  }

  Future<void> getAllPassengers({required String token}) async {
    emit(GetPassengerLoading());
    var result = await passengersRepo.getAllPassengers(token: token);
    result.fold((failure) {
      emit(PassengersErrorState(error: failure.errMessage));
    }, (passengerModel) {
      passengersModel = PassengerInfoModel.fromJson(passengerModel.data);
      emit(GetPassengersSuccess(
          model: PassengerInfoModel.fromJson(passengerModel.data)));
    });
  }

  editPassenger(isConfirm) {
    isConfirm = false;
    emit(EditPassenger());
  }

  Future<void> removePassenger({required String token, required num id}) async {
    var result = await passengersRepo.deletePassenger(token: token, id: id);
    result.fold((failure) {
      emit(PassengerError(error: failure.errMessage));
    },
            (message) {
        });

    emit(RemovePassenger());
  }

  Future <void> addPassengerPersonalId({
    required String idfirstName,
    required String idlastName,
    required String idBirthDate,
    required String nationality,
    required num passengerId,
    required String token
  }) async {
    var result = await passengersRepo.addPassengerPersonalId(
        idfirstName: idfirstName,
        idlastName: idlastName,
        idBirthDate: idBirthDate,
        nationality: nationality,
        passengerId: passengerId,
        token: token);
    result.fold((l) {
      emit(PassengerAddInfoError(error: l.errMessage));
    }, (r) {
      emit(PassengerAddInfoSuccess(message: r));
    });
  }

  Future <void> addPassengerPassport({
    required String passportFirstName,
    required String passportLastName,
    required String passportNumber,
    required String issueDate,
    required String expiredDate,
    required num passengerId,
    required String token
  }) async {
    var result = await passengersRepo.addPassengerPassport(
        passportFirstName: passportFirstName,
        passportLastName: passportLastName,
        passportNumber: passportNumber,
        issueDate: issueDate,
        expiredDate: expiredDate,
        passengerId: passengerId,
        token: token);

    result.fold((l) {
      emit(PassengerAddInfoError(error: l.errMessage));
    }, (r) {
      emit(PassengerAddInfoSuccess(message: r));
    });
  }


  Future <void> addPassengerVisa({
    required String country,
    required String issueDate,
    required String expiredDate,
    required String visaType,
    required num passengerId,
    required String token
  }) async {
    var result = await passengersRepo.addPassengerVisa(visaType: visaType,
        country: country,
        issueDate: issueDate,
        expiredDate: expiredDate,
        passengerId: passengerId,
        token: token);

    result.fold((l) {
      emit(PassengerAddInfoError(error: l.errMessage));
    }, (r) {
      emit(PassengerAddInfoSuccess(message: r));
    });
  }

  PassengerPassportModel ?passengerPassportModel;

  Future <void> getPassengerPassport(
      {required String token, required num id}) async {
    emit(PassengerAddInfoLoading());
    var result = await passengersRepo.getPassengerPassport(
        token: token, id: id);
    result.fold((l) {
      emit(PassengerAddInfoError(error: l.errMessage));
    }, (response) {
      passengerPassportModel = PassengerPassportModel.fromJson(response.data);
      passportFirstName.text = passengerPassportModel!.body!.firstName!;
      passportLastName.text = passengerPassportModel!.body!.lastName!;
      passportNumber.text = passengerPassportModel!.body!.passport_issue_date!;
      passportIssueDate.text = passengerPassportModel!.body!.passport_expires_date!;
      passportExpiredDate.text = passengerPassportModel!.body!.passport_expires_date!;
      emit(PassengerAddInfoSuccess(message: passengerPassportModel!.message!));
    });
  }

  Future <void> getPassengerPersonalId(
      {required String token, required num id}) async {
    emit(PassengerAddInfoLoading());
    var result = await passengersRepo.getPassengerPersonalId(
        token: token, id: id);
    result.fold((l) {
      emit(PassengerAddInfoError(error: l.errMessage));
    }, (r) {

      PassengerPersonalIdModel passengerPersonalIdModel = PassengerPersonalIdModel
          .fromJson(r.data);
      idFirstName.text = passengerPersonalIdModel.body!.firstName!;
      idLastName.text = passengerPersonalIdModel.body!.lastName!;
      idNationality.text = passengerPersonalIdModel.body!.nationality!;
      idBirthDate.text = passengerPersonalIdModel.body!.bitrhdate!;
      emit(PassengerGetPersonalIdSuccess(
          message: passengerPersonalIdModel.message!));
    });
  }

  PassengerVisaModel ? passengerVisaModel;

  Future <void> getPassengerVisa(
      {required String token, required num id}) async {
    emit(PassengerAddInfoLoading());
    var result = await passengersRepo.getPassengerVisa(token: token, id: id);
    result.fold((l) {
      emit(PassengerAddInfoError(error: l.errMessage));
    }, (response) {
      passengerVisaModel = PassengerVisaModel.fromJson(response.data);
      visaType.text = passengerVisaModel!.body!.type!;
      visaCountry.text = passengerVisaModel!.body!.country!;
      visaIssueDate.text = passengerVisaModel!.body!.visa_issue_date!;
      visaExpiredDate.text = passengerVisaModel!.body!.visa_expires_date!;
      emit(
          PassengerGetPersonalIdSuccess(message: passengerVisaModel!.message!));
    });
  }

  Future <void> deletePassengerPassport(
      {required String token, required num id}) async {
    var result = await passengersRepo.deletePassengerPassport(
        token: token, id: id);
    result.fold((failure) => {
    emit(PassengerAddInfoError(error: failure.errMessage))
    }, (message) {
          emit(PassengerAddInfoSuccess(message: message));
        });
  }
  Future <void> deletePassengerVisa(
      {required String token, required num id}) async {
    var result = await passengersRepo.deletePassengerVisa(
        token: token, id: id);
    result.fold((failure) => {
    emit(PassengerAddInfoError(error: failure.errMessage))
    }, (message) {
          emit(PassengerAddInfoSuccess(message: message));
        });
  }
  Future <void> deletePassengerPersonalID(
      {required String token, required num id}) async {
    var result = await passengersRepo.deletePassengerPersonalId(
        token: token, id: id);
    result.fold((failure) => {
    emit(PassengerAddInfoError(error: failure.errMessage))
    }, (message) {
          emit(PassengerAddInfoSuccess(message: message));
        });
  }


}
