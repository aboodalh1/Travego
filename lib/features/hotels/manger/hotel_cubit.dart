import 'package:bloc/bloc.dart';

import 'hotel_states.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit() : super(HoteslInitial());
}
