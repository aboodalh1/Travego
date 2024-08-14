import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo.dart';

class ReserveTripRepoImpl implements ReserveTripRepo{

  final DioHelper dioHelper;
  ReserveTripRepoImpl(this.dioHelper);


  @override
  Future<Either<Failure, Response>> reserveTrip({required num tripId, required List<Map<String, dynamic>> information}) async{
    try{
      var response = await dioHelper.postData(endPoint: '/Reserve_In_Trip/Add_to_Existing_Reservation/{trip_Id}/',
          data: {
            "":information
          }
      );
    return right(response.data);
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> editTripReservation({required num reservationId, required List<Map<String, dynamic>> information}) {
    // TODO: implement editTripReservation
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

}
