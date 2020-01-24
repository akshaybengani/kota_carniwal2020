import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/screens/homepagescreen.dart';
import 'package:kota_carniwal2020/screens/myaccountscreen.dart';
import 'package:kota_carniwal2020/screens/signinscreen.dart';
import 'package:kota_carniwal2020/screens/submitfeedback.dart';
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
            margin: EdgeInsets.only(top: 50, left: 10),
            child: Text(
              'Koca Carniwal',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(MyAccountScreen.routename);
            },
            leading: Icon(
              Icons.person_pin,
              color: theme.primaryColor,
            ),
            title: Text('My Account'),
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
            title: Text('Transactions'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(SubmitFeedback.routename);
            },
            leading: Icon(
              Icons.rate_review,
              color: theme.primaryColor,
            ),
            title: Text('Submit Feedback'),
          ),
          // ListTile(
          //   onTap: () {},
          //   leading: Icon(
          //     Icons.alternate_email,
          //     color: theme.primaryColor,
          //   ),
          //   title: Text('My Account'),
          // ),
          ListTile(
            onTap: () {
              Provider.of<Auth>(context, listen: false).signOut();
              Navigator.of(context)
                  .pushReplacementNamed(SignInScreen.routename);
            },
            leading: Icon(
              Icons.exit_to_app,
              color: theme.primaryColor,
            ),
            title: Text('Logout'),
          ),
          Divider(),
          // ListTile(
          //   onTap: () {},
          //   leading: Icon(
          //     Icons.settings,
          //     color: theme.primaryColor,
          //   ),
          //   title: Text('Settings'),
          // ),
        ],
      ),
    );
  }
}
