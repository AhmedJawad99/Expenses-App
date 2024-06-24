import 'package:app01/models/expense.dart';
import 'package:app01/widgets/expanses_list/expanses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              return onRemoveExpense(expenses[
                  index]); // this give it the old expense or the used expense
            },
            child: ExpensesItem(expense: expenses[index]));
      },
    );
  }
}
