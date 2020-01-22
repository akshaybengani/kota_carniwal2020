import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello everyone'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          // ListView(
          //   children: <Widget>[
          //     ListTile(
          //       leading: Icon(Icons.person_pin),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
