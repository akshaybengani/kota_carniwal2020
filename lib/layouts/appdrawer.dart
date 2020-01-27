import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/screens/myaccountscreen.dart';
import 'package:kota_carniwal2020/screens/productsscreen.dart';
import 'package:kota_carniwal2020/screens/transactionhistoryscreen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 50, left: 10),
            child: const Text(
              'Koca Carniwal',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(MyAccountScreen.routename);
            },
            leading: Icon(
              Icons.person_pin,
              color: theme.primaryColor,
            ),
            title: const Text('My Account'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(TransactionHistoryScreen.routename);
            },
            leading: Icon(
              Icons.history,
              color: theme.primaryColor,
              
            ),
            title: const Text('Transactions'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(ProductsScreen.routename);
            },
            leading: Icon(
              Icons.card_travel,
              color: theme.primaryColor,
            ),
            title: const Text('Products'),
          ),
          
          ListTile(
            onTap: () async{
              await Provider.of<Auth>(context, listen: false).signOutAndDeleteDatabase();
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              // Navigator.of(context)
              //     .pushReplacementNamed(SignInScreen.routename);
            },
            leading: Icon(
              Icons.exit_to_app,
              color: theme.primaryColor,
            ),
            title: const Text('Logout'),
          ),
          const Divider(),
         
        ],
      ),
    );
  }
}
