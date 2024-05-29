part of 'passenger_cubit.dart';

abstract class PassengerStates {}

class PassengerInit extends PassengerStates {}

class AddPassenger extends PassengerStates {}

class EditPassenger extends PassengerStates {}

class ConfirmPassenger extends PassengerStates {}

class RemovePassenger extends PassengerStates {}

class AddPassengerScreen extends PassengerStates {}

class PassengersErrorState extends PassengerStates {
  final String error;
  PassengersErrorState({required this.error});
}

class AddPassengerLoading extends PassengerStates{}
class AddPassengerSuccess extends PassengerStates{
  final String message;
  AddPassengerSuccess({required this.message});
}
