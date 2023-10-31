import 'dart:ffi';

class WalletTransfer {
  String? fromWallet;
  String? toWallet;
  double? amount;

  WalletTransfer(
      {required this.fromWallet, required this.toWallet, required this.amount});
}
