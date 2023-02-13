import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "No transaction available",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/no_Data.jpg'),
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 70,
                      child: FittedBox(
                        child: Text(
                          '₹  ${transactions[index].amount.toStringAsFixed(2)}',
                          style: Theme.of(context).appBarTheme.titleTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).appBarTheme.titleTextStyle,
                          ),
                          Text(
                            DateFormat().format(transactions[index].date),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.blueGrey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
