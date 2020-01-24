import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/providers/auth.dart';
import 'package:kota_carniwal2020/screens/homepagescreen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {

  static const routename = "/signinscreen";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email, password;
  bool _isLoading = false;

  Future<void> _submit() async {
    // To initiate validation checks performed by TextFormFields
    if (!_formKey.currentState.validate()) {
      return;
    }

    // To save the form state
    _formKey.currentState.save();

    // To initiate Loading spinner
    setState(() {
      _isLoading = true;
    });

    try {
      // Send the post request to server to initiate the login process
      await Provider.of<Auth>(context, listen: false).signInWithEmailPassword(email, password);
      // This will only run if the credentials are correct and network is available
      Navigator.of(context).pushReplacementNamed(HomePageScreen.routename);
    } on HttpException catch (error) {
      var errorMessage = "Authentication Failed";

      if (error.toString().contains('Network is unreachable')) {
        errorMessage = 'Please connect to Internet for Login';
      }

      // To display the user with an Alert Dialog about the error.
      _showErrorDialog(errorMessage);
    } catch (e) {
      // To display the user with an Alert Dialog about the error.
      _showErrorDialog("Could not authenticate you. Please try again later");
      print(e.toString());
    }
    // This is required in anycase wheather login or not we need to turn off the loading spinner
    setState(() {
      _isLoading = false;
    });
    // End of Function _submit
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured'),
        content: Text(errorMessage),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Image.asset('assets/kocalogo.jpg', fit: BoxFit.cover),
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Enter Username or Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onSaved: (value) {
                              email = value;
                            },
                            validator: (value) {
                              if (value.isEmpty /* || !value.contains('@') */ ) {
                                return 'Invalid Email Format';
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Enter Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onSaved: (value) {
                              password = value;
                            },
                            validator: (value) {
                              if (value.isEmpty || value.length < 5) {
                                return 'Invalid Password Format';
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.purple,
                              elevation: 5,
                              onPressed: _submit,
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
