import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:travego/features/home/repo/trips_repo/trips_repo.dart';
import 'package:dio/dio.dart';

import '../../../../model/trip_model.dart';

class TripsRepoImpl implements TripsRepo {
  final DioHelper dioHelper;

  TripsRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, String>> getTrips({required String token}) async {
    try {
      var response = dioHelper.getData(endPoint: 'endPoint', token: token);
      return right('response');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getTripServices(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(endPoint: 'endPoint', token: token);
      TripModel tripModel;
      tripModel = TripModel.fromJson(response.data);
      print(tripModel.country);
      return right('response');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getTripById(
      {required String token, required int id}) async {
    try {
      var response = dioHelper.getData(endPoint: 'endPoint', token: token);
      return right('response');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
