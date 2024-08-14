part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState{}

final class SearchFailureState extends SearchState{
    final String errMessage;

    SearchFailureState({required this.errMessage});
}

final class SearchSuccessState extends SearchState{}
