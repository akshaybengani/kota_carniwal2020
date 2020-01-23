import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/models.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            product.product_name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            product.price,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
