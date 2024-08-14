import 'package:bloc/bloc.dart';
import 'package:travego/features/home/repo/trips_repo/trips_repo.dart';
import 'package:travego/model/all_trips_model.dart';
import 'package:travego/model/remote/trip/trip_model.dart';
import 'package:travego/model/remote/trip/trips_cat_model.dart';
import '../../../../../core/utils/shared/constant.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit(this.tripsRepo) : super(TripsInitial());
  final TripsRepo tripsRepo;
  AllTripsModel allTripModel = AllTripsModel(message: 'message', status: 'status', localDateTime: 'localDateTime', body: []);
  AllTripsModel availableTripModel= AllTripsModel(message: 'message', status: 'status', localDateTime: 'localDateTime', body: []);
  TripModel? tripModel;
  TripByCatModel tripByCatModel = TripByCatModel(
      message: 'message',
      status: 'status',
      localDateTime: 'localDateTime',
      body: []);
  bool isTripFavorite = false;

  Future<void> getAllTrips() async {
    emit(GetAllTripsLoading());
    var result = await tripsRepo.getTrips(token: token);
    result.fold((failure) {
      emit(GetAllTripsFailure(error: failure.errMessage));
    }, (response) {
      try {
        allTripModel = AllTripsModel.fromJson(response.data);
      } catch (e) {
        emit(GetAllTripsFailure(error: e.toString()));
      }
      emit(GetAllTripsSuccess());
    });
  }

  Future<void> getTripById(String token, num id) async {
    emit(GetTripLoading());
    var result = await tripsRepo.getTripById(token: token, id: id);
    result.fold((failure) {
      emit(GetAllTripsFailure(error: failure.errMessage));
    }, (response) {
      try {
        tripModel = TripModel.fromJson(response.data);
      } catch (e) {
        emit(GetTripFailure(error: e.toString()));
      }
      emit(GetTripSuccess());
    });
  }

  Future<void> getTripByCat({required String category}) async {
    emit(GetTripByCatLoading());
    var result =
        await tripsRepo.getTripByCategory(token: token, category: category);
    result.fold((failure) {
      emit(GetAllTripsFailure(error: failure.errMessage));
    }, (response) {
      try {
        tripByCatModel = TripByCatModel.fromJson(response.data);
      } catch (e) {
        emit(GetTripByCatError(error: e.toString()));
      }
      emit(GetTripByCatSuccess());
    });
  }
  Future<void> getAvailableTrip() async {
    emit(GetAvailableTripLoading());
    var result =
        await tripsRepo.getTripByStatus(token: token, status: "Available");
    result.fold((failure) {
      print(failure.errMessage);
      emit(GetAvailableTripFailure(errMessage: failure.errMessage));
    }, (response) {
      try {
        availableTripModel = AllTripsModel.fromJson(response.data);
      } catch (e) {
        emit(GetAvailableTripFailure(errMessage: e.toString()));
      }
      emit(GetAvailableTripSuccess());
    });
  }

  Future<void> addTripToFavorite(
      {required String token, required num id}) async {

    var result = await tripsRepo.addTripToFavorite(token: token, id: id);
    result.fold((failure) {
      emit(AddToFavoritesFailure(error: failure.errMessage));
    }, (response) {
      isTripFavorite = true;
      emit(AddToFavoritesSuccess(message: response));
    });
  }

  Future<void> removeTripFromFavorite(
      {required String token, required num id}) async {
    var result = await tripsRepo.removeTripFromFavorite(token: token, id: id);
    result.fold((failure) {
      emit(AddToFavoritesFailure(error: failure.errMessage));
    }, (response) {
      emit(AddToFavoritesSuccess(message: response));
      isTripFavorite = false;
    });
  }
}
