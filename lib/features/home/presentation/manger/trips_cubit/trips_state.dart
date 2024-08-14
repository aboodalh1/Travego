part of 'trips_cubit.dart';

sealed class TripsState {}

final class TripsInitial extends TripsState {}

final class GetAllTripsLoading extends TripsState {}

final class GetAllTripsSuccess extends TripsState {}

final class GetAllTripsFailure extends TripsState {
  final String error;

  GetAllTripsFailure({required this.error});
}

final class GetTripLoading extends TripsState {}

final class GetTripSuccess extends TripsState {}

final class GetTripFailure extends TripsState {
  final String error;

  GetTripFailure({required this.error});
}

final class AddToFavoritesSuccess extends TripsState {
  final String message;

  AddToFavoritesSuccess({required this.message});
}

final class AddToFavoritesFailure extends TripsState {
  final String error;

  AddToFavoritesFailure({required this.error});
}

final class RemoveFromFavoritesSuccess extends TripsState {}

final class RemoveFromFavoritesFailure extends TripsState {
  final String error;

  RemoveFromFavoritesFailure({required this.error});
}

final class GetTripByCatError extends TripsState {
  final String error;

  GetTripByCatError({required this.error});
}

final class GetTripByCatLoading extends TripsState {}

final class GetTripByCatSuccess extends TripsState {}

final class GetAvailableTripLoading extends TripsState {}

final class GetAvailableTripSuccess extends TripsState {}

final class GetAvailableTripFailure extends TripsState {
    final String errMessage;

  GetAvailableTripFailure({required this.errMessage});
}
