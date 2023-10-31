class TransactionPersonToWallet {
  String? type;
  String? createdAt;
  int? amount;
  String? description;

  TransactionPersonToWallet(
      {required this.type,
      required this.createdAt,
      required this.amount,
      required this.description});

  factory TransactionPersonToWallet.fromJson(Map<String, dynamic> json) {
    return TransactionPersonToWallet(
      type: json['type'] as String,
      createdAt: json['createdAt'] as String,
      amount: json['amount'] as int,
      description: json['description'] as String,
    );
  }
}
