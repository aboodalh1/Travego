part of 'reserve_trip_cubit.dart';

sealed class ReserveTripState {}

final class ReserveTripInitial extends ReserveTripState {}

final class AddedPassengerToListState extends ReserveTripState {}

final class RemovePassengerState extends ReserveTripState {}

final class AddedClientToReserveState extends ReserveTripState {}

final class GetPassengersLoading extends ReserveTripState {}

final class GetPassengersSuccess extends ReserveTripState {
  final PassengerInfoModel model;

  GetPassengersSuccess({required this.model});
}

final class PassengersErrorState extends ReserveTripState {
  final String error;

  PassengersErrorState({required this.error});
}

final class GetPassengerLoading extends ReserveTripState {}

final class GetPassengerSuccess extends ReserveTripState {
  final ReservationDetailsModel model;

  GetPassengerSuccess({required this.model});
}

final class GetPassengerErrorState extends ReserveTripState {
  final String error;

  GetPassengerErrorState({required this.error});
}

final class ChangeCheckValueState extends ReserveTripState {}

final class CancelPhotoSuccess extends ReserveTripState {}

final class AddPhotoSuccess extends ReserveTripState {}

final class PassengerReserved extends ReserveTripState {}

final class LastPageState extends ReserveTripState {}

final class GetMyDetailsLoading extends ReserveTripState {}

final class GetMyDetailsSuccess extends ReserveTripState {
  final ReservationDetailsModel model;

  GetMyDetailsSuccess({required this.model});
}

final class GetMyDetailsStateFailure extends ReserveTripState {
  final String error;

  GetMyDetailsStateFailure({required this.error});
}

final class ReserveTripSubmitLoading extends ReserveTripState {}

final class ReserveTripSubmitSuccess extends ReserveTripState {}

final class ReserveTripSubmitFailure extends ReserveTripState {
  final String error;
  ReserveTripSubmitFailure({required  this.error});
}