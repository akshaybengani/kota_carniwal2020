import 'package:flutter/material.dart';

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
                color: Colors.grey,
              ),
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.person_pin,
              color: theme.primaryColor,
            ),
            title: Text('My Account'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.history,
              color: theme.primaryColor,
            ),
            title: Text('Transactions'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.rate_review,
              color: theme.primaryColor,
            ),
            title: Text('Submit Feedback'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.alternate_email,
              color: theme.primaryColor,
            ),
            title: Text('My Account'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.exit_to_app,
              color: theme.primaryColor,
            ),
            title: Text('Logout'),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.settings,
              color: theme.primaryColor,
            ),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
