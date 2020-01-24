import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/models.dart';

class TransactionTile extends StatelessWidget {
  Transaction transaction;
  TransactionTile(this.transaction);

  @override
  Widget build(BuildContext context) {
    return transaction.transactionStatus == 1
        ? Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(
                Icons.add_circle,
                color: Colors.green,
              ),
              title: Text(
                transaction.product_name,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text("Product price : \t ${transaction.product_price}"),
              trailing: Text(transaction.transaction_amount.toString()),
            ),
          )
        : Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
              title: const Text('Deduction Made'),
              subtitle: const Text('Contact Koca Team'),
              trailing: Text(transaction.transaction_amount.toString()),
            ),
          );
  }
}
