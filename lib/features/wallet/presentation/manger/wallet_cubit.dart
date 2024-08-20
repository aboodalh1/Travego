import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/wallet/presentation/view/widgets/my_wallet_screen/my_wallet_screen.dart';
import 'package:travego/model/remote/wallet/transaction_history_model.dart';

import '../../../../core/utils/shared/constant.dart';
import '../../../../model/remote/wallet/wallet_model.dart';
import '../../repo/wallet_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this.walletRepo) : super(WalletInitial());
  final WalletRepo walletRepo;
  WalletModel? walletModel;

  TextEditingController securityCodeController = TextEditingController();
  TextEditingController securityCodeConfController = TextEditingController();
  TextEditingController bankAccount = TextEditingController();

  bool passwordIsSecure = true;
  bool passConfIsSecure = true;
  bool passCodeIsSecure = true;
  TextEditingController chargeCodeController = TextEditingController();

  Icon passwordSecureIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.white,
  );
  Icon passwordCodeSecureIcon = Icon(
    Icons.remove_red_eye_outlined,
    color: defaultColor,
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
 void passCodeChangeSecure() {
    passCodeIsSecure = !passCodeIsSecure;
    passwordCodeSecureIcon = passCodeIsSecure
        ?  Icon(
            Icons.remove_red_eye_outlined,
            color: defaultColor,
          )
        :  Icon(
            Icons.visibility_off_outlined,
            color: defaultColor,
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
      {
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
  TransactionHistoryModel? transactionHistoryModel ;
  Future<void> getAllTransactionHistory({required String token})async{
      emit(GetTransactionHistoryLoading());
      var result = await walletRepo.getAllTransactionHistory(token: token);
      result.fold((failure) {
        emit(WalletCreateFailure(error: failure.errMessage));
      }, (message) {
        transactionHistoryModel = TransactionHistoryModel.fromJson(message.data);
        emit(WalletDeleteSuccess());
      });
  }
}
