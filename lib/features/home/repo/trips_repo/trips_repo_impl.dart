import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:travego/features/home/repo/trips_repo/trips_repo.dart';
import 'package:dio/dio.dart';

class TripsRepoImpl implements TripsRepo {
  final DioHelper dioHelper;

  TripsRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, Response>> getTrips({required String token}) async {
    try {
      var response =
          await dioHelper.getData(endPoint: 'v1/trips', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getAllReservations(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'Trip/Confirmation/GetAll/MyConfirmation', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getTripServices(
      {required String token}) async {
    try {
      var response =
          await dioHelper.getData(endPoint: 'v1/trip-services', token: token);

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getTripById(
      {required String token, required num id}) async {
    try {
      var response =
          await dioHelper.getData(endPoint: 'v1/trips/$id', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addTripToFavorite(
      {required String token, required num id}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: 'v1/favourite/add_trip_to_favorite',
          data: {"favouriteId": id},
          token: token);
      return right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeTripFromFavorite(
      {required String token, required num id}) async {
    try {
      var response = await dioHelper.deleteData(
          endPoint: 'v1/favourite/by-trip/$id', token: token);
      return right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getTripByCategory(
      {required String token, required String category}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'v1/trips/by-category',
          token: token,
          query: {"category": category});
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getTripByStatus(
      {required String token, required String status}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'v1/trips/by-status',
          token: token,
          query: {"status": 'Available'});
      return right(response);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> reviewTrip(
      {required String token,
      required num tripId,
      required num places,
      required num services}) async{
    try {
      num gen= places+services;
      var response = await dioHelper.postData(
          endPoint: 'v1/trip_reviews',
          data:
          {"tripId": tripId,
            "places": places,
            "services": services,
            "generalRating": gen},
          token: token);
      return right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getReviewTrip({required String token, required num tripId}) async{
    try {
      var response = await dioHelper.getData(
          endPoint: '/api/v1/trip_reviews/$tripId',
          token: token,
          query: {"status": 'Available'});
      return right(response);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> payForReservation({required String token, required num reservationId}) async{
    try {
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/WalletPayment/$reservationId',
          token: token,
          data: {});
      return right(response.data['message']);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
