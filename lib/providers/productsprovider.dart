import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsProvider with ChangeNotifier {
  String unresponse = "";

  Future<void> fetchAndSetProducts(BuildContext context) async {
    print('activate');
    final url =
        'http://34.217.102.83/koca/index.php?/api_new/vendorProductList';

    try {
      final response = await http.get(
        url,
        headers: {'Vendorid': '8'},
      );
      final extractedData = json.decode(response.body);
      print(extractedData);
      unresponse = extractedData.toString();
      
      notifyListeners();
    } catch (e) {
      print('Some error occured \n $e');
      unresponse = e.toString();
      notifyListeners();
    }
  }
}
