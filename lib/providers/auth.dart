import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:kota_carniwal2020/providers/databaseprovider.dart';
import 'dart:convert';
import 'models.dart';

class Auth with ChangeNotifier {
  String vendorid;
  Vendor vendor;
  DatabaseProvider databaseProvider = new DatabaseProvider();
  LocalData localData;

  // Future<void> isAuth() async {
  //   this.authCheck = await true;
  // }
  Future<void> signOutAndDeleteDatabase() async {
    vendorid = "";
    await databaseProvider.deleteTableAndDatabase();
  }

  Future<void> fetchFromDatabase() async {
    localData = await databaseProvider.getLocalData();
    //print('LocalData Values :$localData');
    vendor = Vendor(
      id: localData.vid,
      vendor_name: localData.vname,
      contact: localData.vcontact,
      email: localData.vemail,
    );
    //this.vendor.id = localData.vid;
    this.vendorid = localData.vid;
    // this.vendor.vendor_name = localData.vname;
    // this.vendor.contact = localData.vcontact;
    // this.vendor.email = localData.vemail;
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
    final url =
        "http://44.229.0.247/koca/index.php?/api_new/vendorLoginDetails";

    try {
      final response = await http.post(url, headers: {
        'Vendorname': email,
        'Vendorpass': password,
      });

      final data = json.decode(response.body);
      final extractedData = data['response'];
      //print(extractedData);

      final status = extractedData['status'];
      //print('My Status is =$status');

      final msg = extractedData['msg'];
      //print('My Message is =$msg');

      if (status == 'true') {
        // This is for product listing
        vendorid = extractedData['data']['id'];
        //print('My user Id is =$vendorid');

        // Setting up the vendor object
        vendor = Vendor(
          id: extractedData['data']['id'].toString(),
          vendor_name: extractedData['data']['vendor_name'].toString(),
          contact: extractedData['data']['contact'],
          email: extractedData['data']['email'].toString(),
        );
      } else {
        throw HttpException(msg);
      }
    } catch (e) {
      //print(e.toString());
      throw e;
    }
  }
}
