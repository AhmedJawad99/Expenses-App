import 'package:app01/models/expense.dart';
import 'package:app01/widgets/chart/chart.dart';
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
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expenses"),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (C) {
                        return NewExpense(
                          onAddExpense: _addExpense,
                        );
                      });
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
          child: width < 600
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Chart(expenses: _registeredExpenses),
                    ),
                    Expanded(
                      //Expanded to give the ListView a width
                      child: ExpensesList(
                        expenses: _registeredExpenses,
                        onRemoveExpense: _removeExpense,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Chart(expenses: _registeredExpenses)),
                    Expanded(
                      //Expanded to give the ListView a width
                      child: ExpensesList(
                        expenses: _registeredExpenses,
                        onRemoveExpense: _removeExpense,
                      ),
                    ),
                  ],
                ),
        ));
  }
}
