import 'package:app01/models/expense.dart';
import 'package:app01/widgets/expanses_list/expanses_list.dart';
import 'package:app01/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        category: Category.food,
        title: 'Pizza',
        amount: 12.5,
        date: DateTime.now()),
    Expense(
        category: Category.travel,
        title: 'UK',
        amount: 123.2,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'Cinema',
        amount: 24.5,
        date: DateTime.now()),
    Expense(
        category: Category.work,
        title: 'Pen',
        amount: 19.5,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Expenses"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (C) {
                      return NewExpense();
                    });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('data'),
          Expanded(
            //Expanded to give the ListView a width
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      )),
    );
  }
}
