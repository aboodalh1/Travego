import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/hotels/repo/hotels_repo.dart';
import 'package:travego/model/remote/hotel/hotel_model.dart';

part 'hotel_states.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit(this.hotelsRepo) : super(HotelsInitial());
  final HotelsRepo hotelsRepo;
  HotelModel hotelModel = HotelModel(body: []);
  TextEditingController searchController = TextEditingController();

  Future<void> getHotelById({required num id, required String token}) async {
    var result = await hotelsRepo.getHotelById(token: token, id: 1);
    result.fold((failure) {

    },
            (response) {

    });
  }
  Future<void>getAllHotels({required String token})async{
    emit(GetHotelsLoading());
    var result = await  hotelsRepo.getHotels(token: token);
    result.fold((failure) {
                emit(GetHotelsFailure(error: failure.errMessage));
    }, (response) {
          try{
            hotelModel = HotelModel.fromJson(response.data);
          }catch(e){emit(GetHotelsFailure(error: e.toString()));}
      emit(GetHotelsSuccess());
    });
  }

}
