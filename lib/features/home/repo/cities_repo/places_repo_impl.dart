import 'package:dartz/dartz.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';

import 'places_repo.dart';

class PlacesRepoImpl implements PlacesRepo {
  final DioHelper dioHelper;

  PlacesRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, String>> getAllPlaces({required String token}) async {
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
  Future<Either<Failure, String>> getCityByPlace({required String token}) {
    // TODO: implement getCityByCountry
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getPlaceById({required String token, required int id}) {
    // TODO: implement getCityById
    throw UnimplementedError();
  }
  }
