import 'package:flutter/material.dart';

class BarCodeScanner extends StatelessWidget {
  static const routename = '/barcodescanner';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan & Sell'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Container(),
    );
  }
}
