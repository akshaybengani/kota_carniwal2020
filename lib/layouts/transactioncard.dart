import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  String status = " ";
  String msg = "Something Went Wrong";
  String availableBalance = " ";
  String productName = " ";
  String productAmount = " ";
  String barcodevalue = "";

  TransactionCard({
    this.status,
    this.msg,
    this.availableBalance,
    this.productName,
    this.productAmount,
    this.barcodevalue,
  });

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Container(
        height: 250,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                status == "true"
                    ? const Icon(Icons.check_circle,
                        color: Colors.green, size: 50)
                    : const Icon(Icons.not_interested,
                        color: Colors.red, size: 50),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(msg,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Available Balance',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Rs. " + availableBalance,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Product Name',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(productName, style: TextStyle(fontSize: 16))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Product Amount',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text("Rs. " + productAmount, style: TextStyle(fontSize: 16))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Barcode ID',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                isNumeric(barcodevalue)
                    ? Text("$barcodevalue", style: TextStyle(fontSize: 16))
                    : Text("INVALID", style: TextStyle(fontSize: 16))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
