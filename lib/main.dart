import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/providers/productsprovider.dart';
import 'package:kota_carniwal2020/providers/transactionprovider.dart';
import 'package:kota_carniwal2020/screens/barcodescanner.dart';
import 'package:kota_carniwal2020/screens/fetchlocaldata.dart';
import 'package:kota_carniwal2020/screens/homepagescreen.dart';
import 'package:kota_carniwal2020/screens/myaccountscreen.dart';
import 'package:kota_carniwal2020/screens/orderdetailscreen.dart';
import 'package:kota_carniwal2020/screens/productsscreen.dart';
import 'package:kota_carniwal2020/screens/signinscreen.dart';
import 'package:kota_carniwal2020/screens/submitfeedback.dart';
import 'package:kota_carniwal2020/screens/supportscreen.dart';
import 'package:kota_carniwal2020/screens/transactionhistoryscreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Kota Carniwal 2020",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple,
            appBarTheme: AppBarTheme(color: Colors.purple)),
        home: MyHomeApp(),
        routes: {
          SignInScreen.routename: (ctx) => SignInScreen(),
          MyAccountScreen.routename: (ctx) => MyAccountScreen(),
          HomePageScreen.routename: (ctx) => HomePageScreen(),
          SupportScreen.routename: (ctx) => SupportScreen(),
          BarCodeScanner.routename: (ctx) => BarCodeScanner(),
          TransactionHistoryScreen.routename: (ctx) =>
              TransactionHistoryScreen(),
          ProductsScreen.routename: (ctx) => ProductsScreen(),
          OrderDetailScreen.routename: (ctx) => OrderDetailScreen(),
          SubmitFeedback.routename: (ctx) => SubmitFeedback(),
        },
      ),
    );
  }
}

class MyHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkDatabase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return FetchLocalDataScreen();
            } else {
              return SignInScreen();
            }
          }
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Checking Your\nLogin Status...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              const Text(
                'Please Wait ...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> checkDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'koca.db';
    return databaseExists(path);
  }
}
