import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarCodeScanner extends StatefulWidget {
  static const routename = '/barcodescanner';

  @override
  _BarCodeScannerState createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  String barcodevalue;

  @override
  void initState() {
    barcodevalue = "";
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => scanbarcode());
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan & Sell'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Center(child: Text(barcodevalue),),
    );
  }

  Future<void> scanbarcode() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        this.barcodevalue = barcode;
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
            "null (User returned using the 'back' button before scanning anything, Result) ";
      });
    } catch (e) {
      setState(() {
        this.barcodevalue = 'Unknown Error $e';
      });
    }
  }
}
