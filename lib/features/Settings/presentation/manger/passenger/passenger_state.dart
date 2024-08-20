part of 'passenger_cubit.dart';

abstract class PassengerStates {}

class PassengerInit extends PassengerStates {}

class AddPassenger extends PassengerStates {}

class EditPassenger extends PassengerStates {}

class ConfirmPassenger extends PassengerStates {}

class RemovePassenger extends PassengerStates {}

class PassengersErrorState extends PassengerStates {
  final String error;

  PassengersErrorState({required this.error});
}

class AddPassengerLoading extends PassengerStates {}

class AddPassengerSuccess extends PassengerStates {
  final String message;

  AddPassengerSuccess({required this.message});
}

class GetPassengersSuccess extends PassengerStates {
  final PassengerInfoModel model;

  GetPassengersSuccess({required this.model});
}

class GetPassengerLoading extends PassengerStates {}

class PassengerError extends PassengerStates {
  final String error;

  PassengerError({required this.error});
}

final class RemovePassengerLoading extends PassengerStates {}

final class PassengerAddInfoLoading extends PassengerStates {}

final class PassengerAddInfoError extends PassengerStates {
  final String error;

  PassengerAddInfoError({required this.error});
}

class PassengerAddInfoSuccess extends PassengerStates {
  final String message;

  PassengerAddInfoSuccess({required this.message});
}

class PassengerGetPersonalIdSuccess extends PassengerStates {
  final String message;

  PassengerGetPersonalIdSuccess({required this.message});
}

class ChangeToEdit extends PassengerStates {}

final class EditOrConformState extends PassengerStates {}
