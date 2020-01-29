import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/providers/models.dart';
import 'package:provider/provider.dart';

class MyAccountScreen extends StatelessWidget {
  static const routename = "/myaccountscreen";
  Vendor vendorData;

  @override
  Widget build(BuildContext context) {
    vendorData = Provider.of<Auth>(context, listen: false).vendor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Accunt Info'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.purple,
              ),
              title: const Text(
                'ID',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "ID: " + vendorData.id,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.purple,
              ),
              title: const Text(
                'Name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                vendorData.vendor_name,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.email,
                color: Colors.purple,
              ),
              title: const Text(
                'Email',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                vendorData.email,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.contacts,
                color: Colors.purple,
              ),
              title: const Text(
                'Contact',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                vendorData.contact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
