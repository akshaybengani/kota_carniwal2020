import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/productsprovider.dart';
import 'package:kota_carniwal2020/screens/barcodescanner.dart';
import 'package:kota_carniwal2020/screens/homepagescreen.dart';
import 'package:kota_carniwal2020/screens/productsscreen.dart';
import 'package:kota_carniwal2020/screens/signinscreen.dart';
import 'package:kota_carniwal2020/screens/supportscreen.dart';
import 'package:kota_carniwal2020/screens/transactionhistoryscreen.dart';
import 'package:provider/provider.dart';

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
        )
      ],
      child: MaterialApp(
        title: "Kota Carniwal 2020",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple,
            appBarTheme: AppBarTheme(color: Colors.purple)),
        home: MyHomeApp(),
        routes: {
          HomePageScreen.routename: (ctx) => HomePageScreen(),
          SupportScreen.routename: (ctx) => SupportScreen(),
          BarCodeScanner.routename: (ctx) => BarCodeScanner(),
          TransactionHistoryScreen.routename: (ctx) =>
              TransactionHistoryScreen(),
          ProductsScreen.routename: (ctx) => ProductsScreen(),
        },
      ),
    );
  }
}

class MyHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}
