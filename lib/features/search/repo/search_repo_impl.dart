import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:travego/features/search/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final DioHelper dioHelper;

  SearchRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, Response>> searchByTrip(
      {required String text, required String token}) async {
    try {
      var response =
          await dioHelper.getData(endPoint: 'v1/searching/by-trip/$text');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> searchByPlace(
      {required String text, required String token}) async{
    try {
      var response =
          await dioHelper.getData(endPoint: 'v1/searching/by-place/$text');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> searchByHotel(
      {required String text, required String token}) async{
    try {
      var response =
          await dioHelper.getData(endPoint: 'v1/searching/by-hotel/$text');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
