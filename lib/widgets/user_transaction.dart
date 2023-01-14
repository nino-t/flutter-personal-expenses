import 'package:flutter/material.dart';
import 'package:personal_expanses/models/transaction.dart';
import 'package:personal_expanses/widgets/new_transaction.dart';
import 'package:personal_expanses/widgets/transasction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'T-Shirt', amount: 25.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'Bag', amount: 87.99, date: DateTime.now()),
    Transaction(id: 't4', title: 'Jacket', amount: 78.99, date: DateTime.now())
  ];

  void _addNewTransaction(String trxTitle, double trxAmount) {
    final newTrx = Transaction(
        id: DateTime.now().toString(),
        title: trxTitle,
        amount: trxAmount,
        date: DateTime.now());

    setState(() {
      transactions.add(newTrx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(transactions)
      ],
    );
  }
}
