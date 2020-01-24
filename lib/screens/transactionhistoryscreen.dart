import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/layouts/transactiontile.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/providers/transactionprovider.dart';
import 'package:provider/provider.dart';

class TransactionHistoryScreen extends StatefulWidget {
  static const routename = '/transactionhistory';

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  int totalearning = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    refreshTransactions().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> refreshTransactions() async {
    final vendorid = Provider.of<Auth>(context, listen: false).vendorid;
    print('I am listing Transactions');
    await Provider.of<TransactionProvider>(context, listen: false)
        .fetchAndSetTransactions(vendorid)
        .then((_) {
      totalearning =
          Provider.of<TransactionProvider>(context, listen: false).totalearning;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionData = Provider.of<TransactionProvider>(context).trans;
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshTransactions(),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Earning',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                        Text(
                          totalearning.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView.builder(
                        itemCount: transactionData.length,
                        itemBuilder: (ctx, index) =>
                            TransactionTile(transactionData[index]),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
