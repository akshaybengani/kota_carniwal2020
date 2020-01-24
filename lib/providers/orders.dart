// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:kota_carniwal2020/providers/models.dart';
// import 'package:provider/provider.dart';

// import 'auth.dart';

// class Order{

// Future<void> fetchOrderData(BuildContext context, Product productData, String barcodevalue, bool errorFlag ) async {
//     final vendorid = Provider.of<Auth>(context, listen: false).vendorid;
//     final timestampBig = DateTime.now().microsecondsSinceEpoch.toString();
//     final timestamp = timestampBig.substring(0,10);
//     print(timestamp);
    
//     print("VendorID by provider =$vendorid");
//     print("Timestamp by micorsecondssinceepoch =$timestamp");
//     print("ProductId by Provider =${productData.id}");
//     print("Barcode value =$barcodevalue");

//     if (!errorFlag) {
//       final url = "http://34.217.102.83/koca/index.php?/api_new/OrderDetails";

//       try {
//         final response = await http.post(url,
//             body: json.encode({
//               "product_id": "${productData.id}",
//               "vendor_id": "$vendorid",
//               "amount": "${productData.price}",
//               "barcode": "$barcodevalue",
//               "time": "$timestamp"
//             }));

//         final data = json.decode(response.body);
//         final extractedData = data['response'];
//         print(data);
//         print(extractedData);

//         status = extractedData['status'].toString();
//         msg = extractedData['msg'].toString();
//         if (status == "true" || msg == "insufficient Balance") {
//           availableBalance =
//               extractedData['data']['available_amount'].toString();
//         } else {
//           availableBalance = "Cannot Determine";
//         }
//       } catch (e) {
//         print(e.toString());
//         status = "false";
//         msg = "Something went wrong Please try again!";
//         availableBalance = "Cannot Determine";
//       }
//     }
//   }
  
// }