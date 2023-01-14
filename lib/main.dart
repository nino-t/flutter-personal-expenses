// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'T-Shirt', amount: 25.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'Bag', amount: 87.99, date: DateTime.now()),
    Transaction(id: 't4', title: 'Jacket', amount: 78.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Card(
              child: SizedBox(
                width: double.infinity,
                child: Text('Chart!'),
              ),
              elevation: 5,
              color: Colors.blue,
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    const TextField(
                        decoration: InputDecoration(labelText: 'Amount')),
                    FlatButton(
                      child: const Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((trx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '\$${trx.amount}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.purple),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple)),
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
              }).toList(),
            ),
          ],
        ));
  }
}
