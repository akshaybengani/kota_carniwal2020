import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kota_carniwal2020/providers/models.dart';

class ProductsProvider with ChangeNotifier {
  String myresponse = "";
  Product my1stProduct;
  List<Product> _items = [];

  List<Product> get items {
    return _items;
  }

  Future<void> fetchAndSetProducts(String vendorid) async {
    final url =
        'http://34.217.102.83/koca/index.php?/api_new/vendorProductList';

    List<dynamic> _loadedProducts = [];
    List<Product> actualProduct = [];

    try {
      final response = await http.get(
        url,
        headers: {'Vendorid': '$vendorid'},
      );
      final extractedData = json.decode(response.body);
      //print(extractedData);

      // This is the bool status is everything ok or not
      //final String status = extractedData['response']['status'];

      // This is the reason why I am getting result
      //final String msg = extractedData['response']['msg'];

      // If in case the message and status both are correct then only fetching and list data addup will start
      //if (status == 'true' && msg == 'Record found') {
      myresponse = 'Record Found All Ok';
      // Capturing Products data from the json result
      _loadedProducts = extractedData['response']['data']['product'];

      // Adding Data from LoadedProductList to ActualProductList.
      // This is required because my backend friend have not used correct types
      for (int i = 0; i < _loadedProducts.length; i++) {
        actualProduct.add(Product(
          id: _loadedProducts[i]['id'].toString(),
          product_name: _loadedProducts[i]['product_name'].toString(),
          price: _loadedProducts[i]['price'],
        ));
      }
      // This is for scan activity
      my1stProduct = Product(
        id: _loadedProducts[0]['id'].toString(),
        product_name: _loadedProducts[0]['product_name'].toString(),
        price: _loadedProducts[0]['price'],
      );

      // Adding the Downloaded or updated data to the central Database node
      _items = actualProduct;
      // This is to notify all my nodes who are listening for the change
      notifyListeners();
      // } else {
      //   myresponse = "Record Not Found";
      //   //print(myresponse);
      // }
    } catch (e) {
      print('Some error occured \n $e');
      myresponse = e.toString();
      notifyListeners();
    }
  }
}
