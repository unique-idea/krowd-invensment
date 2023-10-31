class User {
  String fullname;
  String email;
  String phone;
  String avatar;
  String idCard;
  String gender;
  DateTime birthDay;
  String taxIdentification;
  String address;
  String bankName;
  String bankAccount;
  String momo;
  bool isEnabled;


  User({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.idCard,
    required this.gender,
    required this.birthDay,
    required this.taxIdentification,
    required this.address,
    required this.bankName,
    required this.bankAccount,
    required this.momo,
    required this.isEnabled,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullname: json['full_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      avatar: json['avatar'] as String,
      idCard: json['id_card'] as String,
      gender: json['gender'] as String,
      birthDay: DateTime.parse(json['birthdate'] as String),
      taxIdentification: json['taxIdentification'] as String,
      address: json['address'] as String,
      bankName: json['bankName'] as String,
      bankAccount: json['bank_account'] as String,
      momo: json['momo'] as String,
      isEnabled: json['enabled'] as bool,
    );
  }
}