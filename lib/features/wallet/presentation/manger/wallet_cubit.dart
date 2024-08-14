import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../model/remote/wallet/wallet_model.dart';
import '../../repo/wallet_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this.walletRepo) : super(WalletInitial());
  final WalletRepo walletRepo;
  WalletModel? walletModel;

  bool passwordIsSecure = true;
  bool passConfIsSecure = true;
  TextEditingController chargeCodeController = TextEditingController();

  Icon passwordSecureIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.white,
  );
  Icon passwordConfSecureIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.grey,
  );

  void passConfChangeSecure() {
    passConfIsSecure = !passConfIsSecure;
    passwordConfSecureIcon = passConfIsSecure
        ? const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.grey,
          )
        : const Icon(
            Icons.visibility_off_outlined,
            color: Colors.grey,
          );
    emit(ChangeSecure());
  }

  void passwordChangeSecure() {
    passwordIsSecure = !passwordIsSecure;
    passwordSecureIcon = passwordIsSecure
        ? const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.grey,
          )
        : const Icon(
            Icons.visibility_off_outlined,
            color: Colors.grey,
          );
    emit(ChangeSecure());
  }

  Future<void> createWallet(
      {required String token,
      required String securityCode,
      required String confSecurityCode,
      required String bankAccount}) async {
    emit(WalletCreateLoading());
    var result = await walletRepo.createWallet(
        token: token,
        securityCode: securityCode,
        confirmSecurityCode: confSecurityCode,
        bankAccount: bankAccount);
    result.fold((failure) {
      emit(WalletCreateFailure(error: failure.errMessage));
    }, (model) {
      walletModel = WalletModel.fromJson(model.data);
      emit(WalletCreateSuccess());
    });
  }

  Future<void> addMoneyToWallet(
      {required String token, required String code}) async {
    emit(AddMoneyToWalletLoading());
    var result = await walletRepo.addMoneyToWallet(token: token, code: code);
    result.fold((failure) {
      emit(AddMoneyToWalletFailure(error: failure.errMessage));
    }, (message) {
      emit(AddMoneyToWalletSuccess(message: message));
    });
  }

  Future<void> getMyWallet({required String token}) async {
    emit(WalletCreateLoading());
    var result = await walletRepo.getMyWallet(token: token);
    result.fold((failure) {
      emit(WalletCreateFailure(error: failure.errMessage));
    }, (model) {
      walletModel = WalletModel.fromJson(model.data);
      emit(WalletCreateSuccess());
    });
  }

  Future<void> deleteMyWallet({required String token}) async {
    emit(WalletCreateLoading());
    var result = await walletRepo.deleteMyWallet(token: token);
    result.fold((failure) {
      emit(WalletCreateFailure(error: failure.errMessage));
    }, (message) {
      emit(WalletDeleteSuccess());
    });
  }
}
