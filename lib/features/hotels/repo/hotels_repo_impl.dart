import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';

import 'hotels_repo.dart';

class HotelsRepoImpl implements HotelsRepo {
  final DioHelper dioHelper;

  HotelsRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, Response>> getHotels({required String token}) async {
    try {
      var response = await dioHelper.getData(endPoint: 'v1/hotel', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getHotelById({required String token, required num id}) async{
    try {
      var response = await dioHelper.getData(endPoint: '/api/v1/hotel_details/1', token: token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
