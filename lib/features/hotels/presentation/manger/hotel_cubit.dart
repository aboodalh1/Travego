import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'hotel_states.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit() : super(HoteslInitial());
  TextEditingController searchController = TextEditingController();

}
