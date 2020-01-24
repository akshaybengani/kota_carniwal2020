import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/layouts/transactioncard.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/providers/models.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kota_carniwal2020/screens/homepagescreen.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatefulWidget {
  static const routename = '/orderdetailscreen';

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  Product productData;
  String barcodevalue;
  bool errorFlag = true;
  bool isLoading = true;
  String status ="";
  String msg = "";
  String availableBalance = "";

  @override
  void initState() {
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
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    productData = Product(
      id: routeArgs['id'],
      product_name: routeArgs['name'],
      price: routeArgs['price'],
    );

    return WillPopScope(
      onWillPop: () =>
          Navigator.of(context).popAndPushNamed(HomePageScreen.routename),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Summary'),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TransactionCard(
                    status: status,
                    msg: msg,
                    availableBalance: availableBalance,
                    productAmount: productData.price,
                    productName: productData.product_name,
                  ),
                  Text(
                    'Thankyou for the order',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    color: Colors.amber,
                    child: Text(
                      "Scan the same item again",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          OrderDetailScreen.routename,
                          arguments: {
                            'id': productData.id,
                            'name': productData.product_name,
                            'price': productData.price,
                          });
                    },
                  )
                ],
              ),
      ),
    );
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
            "User returned using the 'back' button before scanning anything";
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        this.barcodevalue = 'Unknown Error $e';
      });
    }
  }

  Future<void> fetchOrderData() async {
    final vendorid = Provider.of<Auth>(context, listen: false).vendorid;
    final timestampBig = DateTime.now().microsecondsSinceEpoch.toString();
    final timestamp = timestampBig.substring(0,10);
    print(timestamp);
    
    print("VendorID by provider =$vendorid");
    print("Timestamp by micorsecondssinceepoch =$timestamp");
    print("ProductId by Provider =${productData.id}");
    print("Barcode value =$barcodevalue");

    if (!errorFlag) {
      final url = "http://34.217.102.83/koca/index.php?/api_new/OrderDetails";

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
        print(data);
        print(extractedData);

        status = extractedData['status'].toString();
        msg = extractedData['msg'].toString();
        if (status == "true" || msg == "insufficient Balance") {
          availableBalance =
              extractedData['data']['available_amount'].toString();
        } else {
          availableBalance = "Cannot Determine";
        }
      } catch (e) {
        print(e.toString());
        status = "false";
        msg = "Something went wrong Please try again!";
        availableBalance = "Cannot Determine";
      }
    }
  }
}
