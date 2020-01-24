import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  String status = " ";
  String msg = "Something Went Wrong";
  String availableBalance = " ";
  String productName = " ";
  String productAmount = " ";

  TransactionCard({
    this.status,
    this.msg,
    this.availableBalance,
    this.productName,
    this.productAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Container(
        height: 250,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                status == "true"
                    ? Icon(Icons.check_circle, color: Colors.green, size: 50)
                    : Icon(Icons.not_interested, color: Colors.red, size: 50),
                Expanded(child: Text(msg, style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Available Balance',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Rs. " + availableBalance,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Product Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(productName, style: TextStyle(fontSize: 16))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Product Amount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text("Rs. " + productAmount, style: TextStyle(fontSize: 16))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
