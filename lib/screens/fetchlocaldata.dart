import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/providers/productsprovider.dart';
import 'package:kota_carniwal2020/screens/homepagescreen.dart';
import 'package:kota_carniwal2020/screens/signinscreen.dart';
import 'package:provider/provider.dart';

class FetchLocalDataScreen extends StatefulWidget {
  @override
  _FetchLocalDataScreenState createState() => _FetchLocalDataScreenState();
}

class _FetchLocalDataScreenState extends State<FetchLocalDataScreen> {
  bool isLoading = true;
  String loadingMsg = "Hi! \nLet me check your SignIn Status";
  bool showSignInButton = false;

  @override
  void initState() {
    super.initState();
    fetchFromMyProviders();
  }

  Future<void> fetchFromMyProviders() async {
    await Provider.of<Auth>(context, listen: false)
        .fetchFromDatabase()
        .then((_) {
      setState(() {
        loadingMsg =
            "Great! You are already Signed In\n Let me get your products\n Please wait!";
      });
    }).then((_) async {
      await Provider.of<ProductsProvider>(context, listen: false)
          .fetchFromDatabase()
          .then((_) {
        setState(() {
          loadingMsg =
              "Good News !\n Yours Products are on board with us.\nLet's get in";
          isLoading = false;
        });
      }).catchError((onError) {
        setState(() {
          loadingMsg = "Hmmm.. Something went wrong, Please signIn again";
          showSignInButton = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  loadingMsg,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                showSignInButton
                    ? RaisedButton(
                        color: Colors.purple,
                        child: const Text('Sign in Again'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignInScreen.routename);
                        },
                      )
                    : Container(),
              ],
            )
          : HomePageScreen(),
    );
  }
}
