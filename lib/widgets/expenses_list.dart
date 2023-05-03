import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, this.onRemoveExpense, {Key? key})
      : super(key: key);

  final List<Expense> expenses;
  final Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        direction: DismissDirection.endToStart,
        //Display an icon when swiping
        background: Container(
          color: Theme.of(context).colorScheme.error,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        child: ExpenseItem(expenses[index]),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
      ),
    );
  }
}
