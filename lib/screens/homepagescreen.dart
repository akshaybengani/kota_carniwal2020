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
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Share.share(
                  'Hey Download this amazing app for Kota Carniwal 2020 \n https://play.google.com/store/apps/details?id=com.akshaybengani.kocacarniwal2020 ');
            },
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: 100, height: 100),
                      ),
                      Text('Scan & Sell'),
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
                            width: 100, height: 100),
                      ),
                      SizedBox(height: 20),
                      Text('Transaction History'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              // 1 kg bajri ka aata
              // 2 pack ayurveda mehndi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ProductsScreen.routename);
                        },
                        child: Image.asset("assets/cart.png",
                            width: 100, height: 100),
                      ),
                      SizedBox(height: 20),
                      Text('Products'),
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
                            width: 100, height: 100),
                      ),
                      SizedBox(height: 20),
                      Text('Support'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
