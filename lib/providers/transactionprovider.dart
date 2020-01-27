import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kota_carniwal2020/providers/models.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _trans = [];

  int totalearning = 0;

  List<Transaction> get trans {
    return _trans;
  }

  Future<void> fetchAndSetTransactions(String vendorid) async {
    final url =
        "http://44.229.0.247/koca/index.php?/api_new/vendorTransationList";

    try {
      List<Transaction> loadedTransactions = [];
      List<dynamic> listForCount = [];
      final response = await http.get(url, headers: {
        'Vendorid': vendorid,
      });

      final data = json.decode(response.body);
      final extractedData = data['response'];
      print(extractedData);

      final status = extractedData['status'];
      print(status);

      final msg = extractedData['msg'];
      print(msg);

      totalearning = extractedData['data']['total_earning'];
      print(totalearning);
      if (totalearning.toString() == "null") {
        totalearning = 0;
      }
      print(totalearning);

      listForCount = extractedData['data']['transation_history'];

      for (int i = 0; i < listForCount.length; i++) {
        if (int.parse(listForCount[i]['transactionStatus']) != null) {
          if (int.parse(listForCount[i]['transactionStatus']) == 1) {
            loadedTransactions.add(
              Transaction(
                transaction_amount:
                    int.parse(listForCount[i]['transaction_amount']),
                product_name: listForCount[i]['product_name'],
                product_price: int.parse(listForCount[i]['product_price']),
                transactionStatus: 1,
                transactionDate: int.parse(listForCount[i]['transationDate']),
               
              ),
               
            );
            //print(listForCount[i]['trasactionDate']);
          } else if (int.parse(listForCount[i]['transactionStatus']) == 0) {
            loadedTransactions.add(
              Transaction(
                transaction_amount:
                    (listForCount[i]['transaction_amount'] != null)
                        ? (int.parse(listForCount[i]['transaction_amount']))
                        : 0,
                product_name: "",
                product_price: 0,
                transactionStatus: 0,
                transactionDate: int.parse(listForCount[i]['transationDate']),
              ),
            );
            //print(listForCount[i]['trasactionDate']);
          }
        }
      }

      print("Total List Items =${loadedTransactions.length}");

      // Copy all the transactions in this list
      _trans = loadedTransactions;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
