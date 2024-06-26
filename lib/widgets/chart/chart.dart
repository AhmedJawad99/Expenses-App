import 'dart:developer';

import 'package:app01/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;
  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  get maxTotalExpense {
    double maxTotalExpense = 0;
    for (var element in buckets) {
      if (element.totalExpenses > maxTotalExpense) {
        maxTotalExpense = element.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return LayoutBuilder(builder: (ctx, con) {
      log(con.minHeight.toString());
      log(con.maxWidth.toString());
      log(con.minWidth.toString());
      log(con.maxWidth.toString());
      return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(),
        width: double.infinity,
        height: con.maxHeight *
            0.2, // the height is %20, you should use LayoutBuilder also ensure the maxHeight is not infinty
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ], begin: Alignment.center, end: Alignment.topCenter),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final ele in buckets)
                    ChartBar(
                      fill: ele.totalExpenses == 0
                          ? 0
                          : ele.totalExpenses / maxTotalExpense,
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
                children: buckets
                    .map((e) => Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            categoryIcons[e.category],
                            color: isDarkMode
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.7),
                          ),
                        )))
                    .toList()),
          ],
        ),
      );
    });
  }
}
