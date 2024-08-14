part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState{}

final class HomeFailureLoadingState extends HomeState{}

final class HomeSuccessLoadingState extends HomeState{}

final class HomeAddToFavState extends HomeState{}

final class HomeSearchState extends HomeState{}

final class ChangeFilterState extends HomeState{}