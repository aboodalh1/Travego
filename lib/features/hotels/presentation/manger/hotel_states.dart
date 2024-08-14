part of 'hotel_cubit.dart';
abstract class HotelsState {}

final class HotelsInitial extends HotelsState {}

final class GetHotelsLoading extends HotelsState{}

final class GetHotelsSuccess extends HotelsState{}

final class GetHotelsFailure extends HotelsState{
  final String error;
  GetHotelsFailure({required this.error});
}