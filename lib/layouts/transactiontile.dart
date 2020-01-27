import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/models.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  Transaction transaction;
  TransactionTile(this.transaction);

  @override
  Widget build(BuildContext context) {
    String value = transaction.transactionDate.toString();
    value = value + "000000";
    int newTime = int.parse(value);
    var tdate = DateFormat("hh:mm:ss     dd-MM-yyyy").format(DateTime.fromMicrosecondsSinceEpoch(newTime));
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
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text("$tdate"),

              trailing: Text("Rs. "+transaction.transaction_amount.toString()),
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
