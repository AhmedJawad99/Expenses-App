import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _SelectedCategory = Category.food;

  @override
  void dispose() {
    // used to kill the controller after leaving the page
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title for version')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Amount'), prefixText: '\$'),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? "No Date Selected"
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =
                            DateTime(now.year - 1, now.month, now.day);
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: firstDate,
                            lastDate: now);
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      },
                      icon: const Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _SelectedCategory,
                  items: Category.values.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    );
                  }).toList(),
                  onChanged: (newCat) {
                    if (newCat == null) {
                      return;
                    }
                    setState(() {
                      _SelectedCategory = newCat;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    final enterdAmount =
                        double.tryParse(_amountController.text);
                    final bool amountIsInvalid =
                        enterdAmount == null || enterdAmount <= 0;
                    //const snackBar = SnackBar(content: Text('Erro'));
                    //trim() to cut the spaces
                    if (_titleController.text.trim().isEmpty ||
                        amountIsInvalid ||
                        _selectedDate == null) {
                      //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text("error"),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: const Text('OK')),
                              ],
                            );
                          });
                    } else {
                      widget.onAddExpense(
                        Expense(
                            category: _SelectedCategory,
                            title: _titleController.text,
                            amount: enterdAmount,
                            date: _selectedDate!),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Save"))
            ],
          )
        ],
      ),
    );
  }
}
