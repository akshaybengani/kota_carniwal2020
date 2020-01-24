import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/layouts/producttile.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/providers/productsprovider.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  static const routename = '/productsscreen';

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    refreshProducts(context).then((result) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> refreshProducts(BuildContext context) async {
    final vendorid = Provider.of<Auth>(context, listen: false).vendorid;
    print('Why I am printing');
    await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndSetProducts(vendorid);
  }

  @override
  Widget build(BuildContext context) {
    final productData =
        Provider.of<ProductsProvider>(context, listen: true).items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.more_vert),
        //   ),
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshProducts(context),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.all(20),
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: productData.length,
                  itemBuilder: (ctx, index) => ProductTile(productData[index]),
                ),
              ),
      ),
    );
  }
}
