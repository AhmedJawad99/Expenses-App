import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Uuid package used to generate an id
const uuid = Uuid();
// intl package used to write the date in clear form
final dateFormat = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const Map categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
// adding "get" make you don't use the ()
  String get formattoDate {
    return dateFormat.format(date);
  }

  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();
}
