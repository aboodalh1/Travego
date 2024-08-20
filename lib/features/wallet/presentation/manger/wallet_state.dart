part of 'wallet_cubit.dart';


sealed class WalletState {}

final class WalletInitial extends WalletState {}
final class ChangeSecure extends WalletState{}
final class WalletCreateLoading extends WalletState {}

final class WalletCreateSuccess extends WalletState {}
final class GetWalletState extends WalletState {}

final class WalletCreateFailure extends WalletState {
  final String error;
  WalletCreateFailure({required this.error});
}
final class WalletDeleteSuccess extends WalletState{}
final class AddMoneyToWalletLoading extends WalletState {}

final class AddMoneyToWalletSuccess extends WalletState {
  final String message;
  AddMoneyToWalletSuccess({required this.message});
}

final class AddMoneyToWalletFailure extends WalletState {
  final String error;
  AddMoneyToWalletFailure({required this.error});
}

final class GetTransactionHistoryLoading extends WalletState{}
final class GetTransactionHistorySuccess extends WalletState{}
final class GetTransactionHistoryFailure extends WalletState{
  final String error;
  GetTransactionHistoryFailure({required this.error});
}