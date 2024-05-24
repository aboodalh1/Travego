import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';

import 'hotels_repo.dart';

class HotelsRepoImpl implements HotelsRepo {
  final DioHelper dioHelper;

  HotelsRepoImpl(this.dioHelper);

  Future<Either<Failure, String>> getHotels({required String token}) async {
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
  //
  // Future<Either<Failure, String>> getTripServices(
  //     {required String token}) async {
  //   try {
  //     var response = dioHelper.getData(endPoint: 'endPoint', token: token);
  //     return right('response');
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
  //
  // Future<Either<Failure, String>> getTripById(
  //     {required String token, required int id}) async {
  //   try {
  //     var response = dioHelper.getData(endPoint: 'endPoint', token: token);
  //     return right('response');
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}
