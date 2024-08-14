import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:travego/features/wallet/repo/wallet_repo.dart';

class WalletRepoImpl implements WalletRepo {
  final DioHelper dioHelper;

  WalletRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, Response>> createWallet({required String token,
    required String securityCode, required String confirmSecurityCode, required String bankAccount}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: 'CLient/Account/Create_My_Wallet', data: {
        "securityCode": securityCode,
        "confiremSecurityCode": confirmSecurityCode,
        "bankAccount": bankAccount
          });
      return right(response);
    }catch(e) {
  if (e is DioException) {
  return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));
  }
}

@override
Future<Either<Failure, String>> addMoneyToWallet(
    {required String token, required String code}) async {
  try {
    var response = await dioHelper.postData(
        endPoint: 'CLient/Account/Add_Money_To_Wallet', data: {
      "code": code
    },token: token);
    return right(response.data);
  } catch (e) {
    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
}

@override
Future<Either<Failure, Response>> getMyWallet({required String token}) async {
  try {
  var response = await dioHelper.getData(endPoint: 'CLient/Account/Get_My_Wallet',token: token);
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
Future<Either<Failure, String>> deleteMyWallet(
    {required String token}) async {
  try {
    var response = await dioHelper.deleteData(endPoint: 'CLient/Account/Delete_My_Wallet',token: token);

    return right(response.data['message']);
  } catch (e) {
    print(e.toString());
    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
}}