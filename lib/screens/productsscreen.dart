import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const routename = '/productsscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text('Listed Products'),
          ],
        ),
      ),
    );
  }
}
