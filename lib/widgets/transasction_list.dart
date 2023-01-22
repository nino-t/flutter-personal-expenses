import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            final trx = transactions[index];
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      '\$${trx.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.purple)),
                    padding: const EdgeInsets.all(7),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        trx.title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(trx.date),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length),
    );
  }
}
