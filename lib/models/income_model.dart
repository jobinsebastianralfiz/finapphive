// income_model.dart

import 'package:hive/hive.dart';

part 'income_model.g.dart';

@HiveType(typeId: 1)
class IncomeModel extends HiveObject {
  @HiveField(0)
  late String category;

  @HiveField(1)
  late double amount;

  @HiveField(2)
  late DateTime date;

  IncomeModel({required this.category, required this.amount, required this.date});
}
