import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';

import 'cities_repo.dart';

class CitiesRepoImpl implements CitiesRepo {
  final DioHelper dioHelper;

  CitiesRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, String>> getAllCities({required String token}) async {
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
  Future<Either<Failure, String>> getCityByCountry({required String token}) {
    // TODO: implement getCityByCountry
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, String>> getCityById({required String token, required int id}) {
    // TODO: implement getCityById
    throw UnimplementedError();
  }
  }
