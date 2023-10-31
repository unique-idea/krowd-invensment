import 'package:krowd_invesment_footer/pages/notification/model/transaction_person_to_wallet.dart';

class TransactionResponse {
  String? generalWalletId;
  List<TransactionPersonToWallet>? fromPersonalToProjectWallet;

  TransactionResponse(
      {required this.generalWalletId,
      required this.fromPersonalToProjectWallet});

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      generalWalletId: json['generalWalletId'] as String,
      fromPersonalToProjectWallet: List<TransactionPersonToWallet>.from(
        (json['fromPersonalToProjectWallet'] as List<dynamic>).map(
          (transactionJson) =>
              TransactionPersonToWallet.fromJson(transactionJson),
        ),
      ),
    );
  }
}
