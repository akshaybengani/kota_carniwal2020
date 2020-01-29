import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:kota_carniwal2020/layouts/transactioncard.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/providers/models.dart';
import 'package:kota_carniwal2020/providers/productsprovider.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

class BarCodeScanner extends StatefulWidget {
  static const routename = '/barcodescanner';

  @override
  _BarCodeScannerState createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  String barcodevalue;
  bool errorFlag = true;
  bool isLoading = true;
  String status = "";
  String msg = "";
  String availableBalance = "";
  Product productData;

  @override
  void initState() {
    barcodevalue = "";
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scanbarcode().then((_) {
        fetchOrderData().then((_) {
          setState(() {
            isLoading = false;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan & Sell'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.more_vert),
        //     onPressed: () {},
        //   )
        // ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TransactionCard(
                    status: status,
                    msg: msg,
                    availableBalance: availableBalance,
                    productAmount: productData.price,
                    productName: productData.product_name,
                    barcodevalue: barcodevalue,
                  ),
                  status == "true" ? const Text(
                    'Thankyou for the order',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ) : Container(),
                  const SizedBox(height: 10),
                  RaisedButton(
                    color: Colors.amber,
                    child: const Text(
                      "Scan Again",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(BarCodeScanner.routename);
                    },
                  )
                ],
              ),
            ),
    );
  }

  Future<void> fetchOrderData() async {
    final vendorid = Provider.of<Auth>(context, listen: false).vendorid;
    await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndSetProducts(vendorid);
    productData =
        Provider.of<ProductsProvider>(context, listen: false).my1stProduct;
        
    final timestampBig = DateTime.now().microsecondsSinceEpoch.toString();
    //print(timestampBig);
    final timestamp = timestampBig.substring(0, 10);
    //print(timestamp);

    //print("VendorID by provider =$vendorid");
    //print("Timestamp by micorsecondssinceepoch =$timestamp");
    //print("ProductId by Provider =${productData.id}");
    //print("Barcode value =$barcodevalue");

    if (!errorFlag) {
      final url = "http://44.229.0.247/koca/index.php?/api_new/OrderDetails";

      try {
        final response = await http.post(url,
            body: json.encode({
              "product_id": "${productData.id}",
              "vendor_id": "$vendorid",
              "amount": "${productData.price}",
              "barcode": "$barcodevalue",
              "time": "$timestamp"
            }));

        final data = json.decode(response.body);
        final extractedData = data['response'];
        //print(data);
        //print(extractedData);

        status = extractedData['status'].toString();
        msg = extractedData['msg'].toString();
        if (status == "true" || msg == "insufficient Balance") {
          availableBalance =
              extractedData['data']['available_amount'].toString();
        } else {
          availableBalance = "Cannot Determine";
        }
      } catch (e) {
        //print("The error message I get "+e.toString());
        status = "false";
        msg = "Something went wrong Please try again!";
        availableBalance = "Cannot Determine";
      }
    } else {
      msg = "Back Button Pressed while scanning Please Try again !";
    }
  }

  Future<void> scanbarcode() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        this.barcodevalue = barcode;
        errorFlag = false;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcodevalue = 'Camera Permission Not Granted';
        });
      } else {
        setState(() {
          this.barcodevalue = 'Unknown Error $e';
        });
      }
    } on FormatException {
      setState(() {
        this.barcodevalue =
            "You have Pressed Back Button while Scanning Please Try Again!";
      });
    } catch (e) {
      setState(() {
        this.barcodevalue = 'Unknown Error $e';
      });
    }
  }

}
