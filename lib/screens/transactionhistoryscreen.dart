import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  static const routename = '/transactionhistory';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Earning',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                Text('1000 Rs.', style: TextStyle(fontSize: 20,),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
