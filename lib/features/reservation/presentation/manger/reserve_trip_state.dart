part of 'reserve_trip_cubit.dart';

sealed class ReserveTripState {}

final class ReserveTripInitial extends ReserveTripState {}

final class AddedPassengerToListState extends ReserveTripState {}

final class RemovePassengerState extends ReserveTripState {}

final class AddedClientToReserveState extends ReserveTripState {}

final class GetPassengerLoading extends ReserveTripState {}

final class GetPassengersSuccess extends ReserveTripState {
  final PassengerInfoModel model;
  GetPassengersSuccess({required this.model});
}

final class PassengersErrorState extends ReserveTripState {
  final String error;
  PassengersErrorState({required this.error});
}
