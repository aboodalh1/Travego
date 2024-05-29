import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/hotels/repo/hotels_repo_impl.dart';

import 'hotel_states.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit(HotelsRepoImpl hotelsRepoImpl) : super(HoteslInitial());
  TextEditingController searchController = TextEditingController();

}
