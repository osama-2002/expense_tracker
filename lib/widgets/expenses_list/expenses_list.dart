import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expensesList, required this.onRemove, super.key});
  final List<Expense> expensesList;
  final void Function(int index) onRemove;

  @override
  Widget build(context) {
    return ListView.builder(
      //creates items only when they are visible or about to be visible
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            vertical: 7,
          ),
          child: const Center(
            child: Text(
              "Delete",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        key: ValueKey(expensesList[index]),
        child: ExpenseItem(
          expensesList[index],
        ),
        onDismissed: (direction) {
          onRemove(index);
        },
      ),
      itemCount: expensesList.length,
    );
  }
}
