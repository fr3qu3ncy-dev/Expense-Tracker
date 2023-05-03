import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  //Create a list of expenses with some random values
  List<Expense> expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(
        _addExpense,
      ),
    );
  }

  _addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  _removeExpense(Expense expense) {
    final expenseIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    //Show undo snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense removed'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final availableWidth = mediaQuery.size.width;

    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    );

    if (expenses.isNotEmpty) {
      mainContent = ExpensesList(expenses, _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: availableWidth < 600
          ? Column(
              children: [
                Chart(expenses: expenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: expenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
