import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/layouts/transactiontile.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/providers/models.dart';
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
  bool noDataFlag = false;
  List<Transaction> transactionData;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    refreshTransactions().then((_) {
      setState(() {
        if (totalearning == 0) {
          noDataFlag = true;
        }
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
          transactionData = Provider.of<TransactionProvider>(context, listen: false).trans;
      totalearning =
          Provider.of<TransactionProvider>(context, listen: false).totalearning;
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.more_vert),
        //   )
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshTransactions(),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Total Earning',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                        Text(
                          totalearning.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    noDataFlag
                        ? Container(
                            margin: EdgeInsets.only(top: 100),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'No Transactions Found!',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'If Problem persist then please\nLogOut and LogIn Again',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )
                        : Container(
                            // decoration: BoxDecoration(
                            //     border:
                            //         Border.all(width: 2, color: Colors.purple)),
                            height: MediaQuery.of(context).size.height * 0.7,
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
