// ignore: file_names
class WalletType {
  String? name;
  String? description;
  String? mode;

  WalletType(
      {
      this.name,
      this.description,
      this.mode});

  WalletType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['mode'] = mode;
    return data;
  }
}
