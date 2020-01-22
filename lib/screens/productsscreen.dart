import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/productsprovider.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {

  static const routename = '/productsscreen';

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Future<void> getProductsData(BuildContext context, var vendorid) async {
    print('I am Active');
    await Provider.of<ProductsProvider>(context, listen: false).fetchAndSetProducts(context, vendorid);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
  final productData = Provider.of<ProductsProvider>(context, listen: false);
  final vendorid = 8;
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
            RaisedButton(
              child: Text('Fetch Data'),
              onPressed: () => getProductsData(context, 8),
            ),
            Text(productData.myresponse),
          ],
        ),
      ),
    );
  }
}
