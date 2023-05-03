import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie_creation_outlined,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return '${date.year}'
        '/${date.month.toString().padLeft(2, "0")}'
        '/${date.day.toString().padLeft(2, "0")}';
  }

  IconData get icon {
    return categoryIcons[category]!;
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  ExpenseBucket(this.category, this.expenses);

  double get totalExpenses {
    return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }
}
