import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/errors/failure.dart';

abstract class WalletRepo{
  Future <Either<Failure,Response>>createWallet({required String token,required String securityCode,required String confirmSecurityCode,required String bankAccount});
  Future <Either<Failure,String>>addMoneyToWallet({required String token,required String code});
  Future <Either<Failure,Response>>getMyWallet({required String token});
  Future <Either<Failure,String>>deleteMyWallet({required String token});
}