import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final TextEditingController searchController = TextEditingController();

  String? selectedFilter = "Trips";
  void changeFilter(String filter){
    selectedFilter = filter;
    emit(ChangeFilterState());
  }

}
