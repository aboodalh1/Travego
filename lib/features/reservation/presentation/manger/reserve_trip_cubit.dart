import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travego/core/utils/shared/constant.dart';

import '../../../../model/remote/client/my_details_model.dart';
import '../../../../model/remote/passenger/passenger_info_model.dart';
import '../../../../model/reservation/reservation_details_model.dart';
import '../../repo/reserve_trip_repo.dart';

part 'reserve_trip_state.dart';

class ReserveTripCubit extends Cubit<ReserveTripState> {
  ReserveTripCubit(this.reserveTripRepo) : super(ReserveTripInitial());

  final ReserveTripRepo reserveTripRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkValue = false;
  bool checkMyValue = false;
  PassengerInfoModel passengerInfoModel = PassengerInfoModel(body: []);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final nationalityController = TextEditingController();
  final passportIssueDateController = TextEditingController();
  final passportExpiresDateController = TextEditingController();
  final passportNumberController = TextEditingController();
  final visaTypeController = TextEditingController();
  final visaCountryController = TextEditingController();
  final visaIssueDateController = TextEditingController();
  final visaExpiresDateController = TextEditingController();

  final PageController pageController = PageController();
  bool isLast = false;
  void refresh(){emit(LastPageState());}
  void lastPage(int index) {
    if (index == 2) {
      isLast = true;
    } else {
      isLast = false;
    }
    emit(LastPageState());
  }

  final TextEditingController passportImageController = TextEditingController();
  final TextEditingController visaImageController = TextEditingController();
  final TextEditingController personalIdImageController =
      TextEditingController();
  File? personalIdImage;
  File? visaImage;
  File? passportImage;

  Future<void> pickImage(
      {required ImageSource source,
      required File? image,
      required TextEditingController controller}) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      controller.text = pickedFile.path; // Store file path in TextField
      reserveTripRepo.uploadImage(token: token, image: image.path);
      emit(AddPhotoSuccess());
    }
  }

  void cancelPhoto(
      {required File? image, required TextEditingController controller}) {
    image = null;
    controller.clear();
    emit(CancelPhotoSuccess());
  }

  void changeCheckValue() {
    checkValue = !checkValue;
    emit(ChangeCheckValueState());
  }

  void changeMyCheckValue() {
    checkMyValue = !checkMyValue;
    emit(ChangeCheckValueState());
  }


  void addPersonnes() {
    personnes.add({
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'fathername': fatherNameController.text,
      'mothername': motherNameController.text,
      'birthdate': birthDateController.text,
      "nationality": nationalityController.text,
      "personalIdentity_PHOTO": "Gg",
      "passport_Issue_date": passportIssueDateController.text,
      "passport_Expires_date": passportExpiresDateController.text,
      "passport_Number": passportNumberController.text,
      "passport_PHOTO": "string",
      "visa_Type": visaTypeController.text,
      "visa_Country": visaCountryController.text,
      "visa_Issue_date": visaIssueDateController.text,
      "visa_Expires_date": visaExpiresDateController.text,
      "visa_PHOTO": "String"
    });
    firstNameController.clear();
    lastNameController.clear();
    fatherNameController.clear();
    motherNameController.clear();
    birthDateController.clear();
    nationalityController.clear();
    passportIssueDateController.clear();
    passportExpiresDateController.clear();
    passportNumberController.clear();
    visaTypeController.clear();
    visaCountryController.clear();
    visaIssueDateController.clear();
    visaExpiresDateController.clear();
    print(personnes);
    emit(AddedPassengerToListState());
  }

  void addPassengersToReserve(String name) {
    reservationPersonnes
        .add(personnes.firstWhere((map) => map['firstname'] == name));
    print(reservationPersonnes);
    emit(PassengerReserved());
  }

  void removePassenger(String name) {
    personnes.removeWhere((element) => element['firstname'] == name);
    emit(RemovePassengerState());
  }

  void removePassengerFromReserve(String name) {
    reservationPersonnes.removeWhere((element) => element['firstname'] == name);
    print(personnes);
    emit(RemovePassengerState());
  }

  void removeClientFromReserve() {
    // reservationPersonnes.removeWhere((element) => );
  }

  void addClientToReserve() {
    reservationPersonnes.add({
      'firstname': myDetailsModel!.body.firstname,
      'lastname': myDetailsModel!.body.lastname,
      'fathername': myDetailsModel!.body.fathername,
      'mothername': myDetailsModel!.body.mothername,
      'birthdate': myDetailsModel!.body.birthdate,
      "nationality": "Syrian",
      "personalIdentity_PHOTO": "Gg",
      "passport_Issue_date": myDetailsModel!.body.passportIssueDate,
      "passport_Expires_date": myDetailsModel!.body.passportExpiresDate,
      "passport_Number": myDetailsModel!.body.passportNumber,
      "passport_PHOTO": "string",
      "visa_Type": myDetailsModel!.body.visaType,
      "visa_Country": myDetailsModel!.body.visaCountry,
      "visa_Issue_date": myDetailsModel!.body.visaIssueDate,
      "visa_Expires_date": myDetailsModel!.body.visaExpiresDate,
      "visa_PHOTO": "String"
    });
    emit(AddedClientToReserveState());
  }

  Future<void> getAllPassengers({required String token}) async {
    emit(GetPassengersLoading());
    var result = await reserveTripRepo.getAllPassengers(token: token);
    result.fold((failure) {
      emit(PassengersErrorState(error: failure.errMessage));
    }, (passengerModel) {
      passengerInfoModel = PassengerInfoModel.fromJson(passengerModel.data);
      emit(GetPassengersSuccess(
          model: PassengerInfoModel.fromJson(passengerModel.data)));
    });
  }

  ReservationDetailsModel? myDetailsModel;

  Future<void> getMyDetails({required String token}) async {
    emit(GetMyDetailsLoading());
    var result = await reserveTripRepo.getMyInformation(token: token);
    result.fold((failure) {
      emit(GetMyDetailsStateFailure(error: failure.errMessage));
    }, (response) {
      myDetailsModel = ReservationDetailsModel.fromJson(response.data);
      addClientToReserve();
      emit(GetMyDetailsSuccess(model: myDetailsModel!));
    });
  }

  ReservationDetailsModel? passengerDetailsModel;
  Future<void> getPassengerDetails(
      {required String token, required num id}) async {
    emit(GetPassengerLoading());
    var result =
        await reserveTripRepo.getPassengerInformation(token: token, id: id);
    result.fold((failure) {
      emit(GetPassengerErrorState(error: failure.errMessage));
    }, (response) {
      passengerDetailsModel = ReservationDetailsModel.fromJson(response.data);
      reservationPersonnes.add(
          {
            "firstname":passengerDetailsModel!.body.firstname,
            "lastname": passengerDetailsModel!.body.lastname,
            "fathername": passengerDetailsModel!.body.fathername,
            "mothername": passengerDetailsModel!.body.mothername,
            "birthdate": passengerDetailsModel!.body.birthdate,
            "nationality": 'Syrian',
            "personalIdentity_PHOTO": "Gg",
            "passport_Issue_date": passengerDetailsModel!.body.passportIssueDate,
            "passport_Expires_date": passengerDetailsModel!.body.passportExpiresDate,
            "passport_Number": passengerDetailsModel!.body.passportNumber,
            "passport_PHOTO": "string",
            "visa_Type": passengerDetailsModel!.body.visaType,
            "visa_Country": passengerDetailsModel!.body.visaCountry,
            "visa_Issue_date": passengerDetailsModel!.body.visaIssueDate,
            "visa_Expires_date": passengerDetailsModel!.body.visaExpiresDate,
            "visa_PHOTO": "String"
          }
      );
      emit(GetPassengersSuccess(model: response.data));
    });
  }

  Future <void> reserveTrip({required String token,required List<Map<String,String>> passengers,required num tripId})async{
    emit(ReserveTripSubmitLoading());
    var result = await reserveTripRepo.reserveTrip( token: token,tripId: tripId, information: passengers);
    result.fold((failure) {
        emit(ReserveTripSubmitFailure(error: failure.errMessage));
    }, (response) {
        emit(ReserveTripSubmitSuccess());
    });
  }

}
