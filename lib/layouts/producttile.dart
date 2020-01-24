import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/models.dart';
import 'package:kota_carniwal2020/screens/orderdetailscreen.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushReplacementNamed(OrderDetailScreen.routename , arguments: {
          'id' : product.id,
          'name' : product.product_name,
          'price' : product.price,
        } );
      },
          child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              product.product_name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              product.price,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
