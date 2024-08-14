import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo.dart';
import 'package:travego/model/remote/passenger/passenger_info_model.dart';

part 'reserve_trip_state.dart';

class ReserveTripCubit extends Cubit<ReserveTripState> {
  ReserveTripCubit(this.reserveTripRepo) : super(ReserveTripInitial());

  final ReserveTripRepo reserveTripRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  List<Map>? personnes=[
     {

     },
     {

     },

   ];

  List <Map>? reservationPersonnes=[];

  void addPersonnes(){
    personnes!.add(
      {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'fatherName': fatherNameController.text,
        'motherName': motherNameController.text,
        'birthDate': birthDateController.text,
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


    emit(AddedPassengerToListState());
  }
  void removePassenger(){
    personnes!.removeAt(0);
    emit(RemovePassengerState());
  }

  void addClientToReserve(){
    reservationPersonnes!.add(
      {

      }
    );
    emit(AddedClientToReserveState());

}

  void addPassengerToReserve(){

  }



  Future<void> getAllPassengers({required String token}) async {
    emit(GetPassengerLoading());
    var result = await reserveTripRepo.getAllPassengers(token: token);
    result.fold((failure) {
      emit(PassengersErrorState(error: failure.errMessage));
    }, (passengerModel) {
      passengerInfoModel = PassengerInfoModel.fromJson(passengerModel.data);
      emit(GetPassengersSuccess(
          model: PassengerInfoModel.fromJson(passengerModel.data)));
    });
  }

}
