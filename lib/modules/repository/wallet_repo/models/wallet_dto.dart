
import 'package:krowd_invesment_footer/modules/repository/wallet_type_repo/models/wallet_type_dto.dart';

class WalletDTO {
  String? iconUrl;
  WalletType? symbol;
  String? name;
  String? price;
  String? change;
  String? color;

  WalletDTO(
      {this.iconUrl,
      this.symbol,
      this.name,
      this.price,
      this.change,
      this.color});

  WalletDTO.fromJson(Map<String, dynamic> json) {
    iconUrl = json['iconUrl'];
    symbol = json['symbol'];
    name = json['name'];
    price = json['price'];
    change = json['change'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iconUrl'] = iconUrl;
    data['symbol'] = symbol;
    data['name'] = name;
    data['price'] = price;
    data['change'] = change;
    data['color'] = color;
    return data;
  }
}
