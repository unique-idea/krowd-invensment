import 'package:hive/hive.dart';

part 'add_date.g.dart';

@HiveType(typeId: 1)
class AddData extends HiveObject {
  @HiveField(0)
  String from;
  @HiveField(1)
  String explain;
  @HiveField(2)
  double amount;
  @HiveField(3)
  String IN;
  @HiveField(4)
  DateTime datetime;
   @HiveField(5)
  String to;
  AddData(this.IN, this.amount, this.datetime, this.explain, this.from, this.to);
}
