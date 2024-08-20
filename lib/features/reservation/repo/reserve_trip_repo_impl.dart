import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo.dart';

class ReserveTripRepoImpl implements ReserveTripRepo{

  final DioHelper dioHelper;
  ReserveTripRepoImpl(this.dioHelper);


  @override
  Future<Either<Failure, String>> reserveTrip({required String token,required num tripId, required List<Map<String, String>> information}) async{
    print(token);
    try{
      var response = await dioHelper.postDataWithReserve(endPoint: 'Reserve/InTrip/$tripId',
          data: information
          ,token: token
      );

    return right('response.data');
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> editTripReservation({required num reservationId, required List<Map<String, dynamic>> information}) {
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, Response>> deleteReservation({required num reservationId}) {
    
    throw UnimplementedError();
  }



  @override
  Future<Either<Failure, Response>> getAllPassengers(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_All_Client_Passengers', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  // not used
  @override
  Future<Either<Failure, Response>> getClientInfo(
      {required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/Get_All_Client_Passengers', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, Response>> uploadImage(
      {required String token,required String image}) async {
    try {
      var response = await dioHelper.postDataForPhoto(
        path:'/data/user/0/com.example.travego/cache/c9c8e4bf-6c0f-4d0d-9c2b-21a2bc3a1fe4606830341775446809.jpg' ,
          endPoint: 'photo', token: token);
      print(response.data);
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
  Future<Either<Failure, Response>> getMyInformation({required String token}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/GetAll/MyDetails', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getPassengerInformation({required String token, required num id}) async{
    try {

      var response = await dioHelper.getData(
          endPoint: 'CLient/Account/GetAll/PassengerDetails/$id', token: token);
      return right(response);
    } catch (e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}
