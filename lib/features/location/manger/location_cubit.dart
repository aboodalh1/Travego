import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/model/place_model.dart';
import 'package:travego/features/location/manger/location_states.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/network/remote/dio_helper.dart';
import '../../../core/utils/shared/constant.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit() : super(LocationInitState());
  LocationCubit get(context) => BlocProvider.of(context);
  Set<Marker> markers = {};
  Set<Polygon> polygons = {};
  Set<Circle> circles = {};

  void getPlaces(context,
      {required String categories,
      required String limit,
      required double lon,
      required double lat}) {
    emit(LoadingPlacesState());
    DioHelper()
        .getData(
            url:
                'places?limit=$limit&filter=circle:${lat.toString()},${lon.toString()},5000&categories=$categories&apiKey=cc6c182c370c4e73be0971ed1cb8e26d')
        .then((value) {
      placeModel = PlaceModel.fromJson(value.data);
      print(value.data);
      //  LocationScreen().initCircles(context, lat: lat, long: lon);
      // LocationScreen().initMarker(context);
      emit(GetPlacesSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetPlacesFaliureState());
    });
  }

  void addMarker() {
    emit(GetPlacesSuccessState());
  }

  void dispoeMap() {
    emit(LocationClosedState());
  }
}
