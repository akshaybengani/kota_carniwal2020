import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/layouts/appdrawer.dart';
import 'package:kota_carniwal2020/screens/barcodescanner.dart';
import 'package:kota_carniwal2020/screens/productsscreen.dart';
import 'package:kota_carniwal2020/screens/supportscreen.dart';
import 'package:kota_carniwal2020/screens/transactionhistoryscreen.dart';
import 'package:share/share.dart';

class HomePageScreen extends StatelessWidget {
  static const routename = '/homepagescreen';

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var imageWidth = screenHeight * 0.18;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Share.share(
                  'Hey Vendors Download KOCA2020 for the annual largest student fest Kota Carnival 2020 \n https://play.google.com/store/apps/details?id=com.akshaybengani.kocacarnival2020 ');
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        // Screen margin
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(BarCodeScanner.routename);
                      },
                      child: Image.asset("assets/barcodescanner.png",
                          width: imageWidth),
                    ),
                    const SizedBox(height: 20),
                    const Text('Scan & Sell',style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(TransactionHistoryScreen.routename);
                      },
                      child: Image.asset("assets/transactionhistory.png",
                          width: imageWidth),
                    ),
                    const SizedBox(height: 20),
                    const Text('Transaction\nHistory',style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ProductsScreen.routename);
                      },
                      child:
                          Image.asset("assets/cart.png", width: imageWidth),
                    ),
                    const SizedBox(height: 20),
                    const Text('Products',style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(SupportScreen.routename);
                      },
                      child: Image.asset("assets/support.png",
                          width: imageWidth),
                    ),
                    const SizedBox(height: 20),
                    const Text('Support',style: TextStyle(fontSize: 20) ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
