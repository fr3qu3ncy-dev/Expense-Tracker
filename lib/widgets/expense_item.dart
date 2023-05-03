import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding:
            const EdgeInsets.only(left: 30, top: 15, bottom: 15, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Text Widget for the amount
            Text(
              '\$${expense.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Column(
              children: [
                //Text Widget for the title
                Text(
                  expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                //Text Widget for the date
                SizedBox(
                  width: 100,
                  child: Text(
                    //Convert the date to a yyyy/mm/dd format
                    expense.formattedDate,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(5),
              child: Icon(
                expense.icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
