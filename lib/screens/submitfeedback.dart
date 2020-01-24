import 'package:flutter/material.dart';
import 'package:kota_carniwal2020/screens/homepagescreen.dart';

class SubmitFeedback extends StatelessWidget {
  static const routename = "/sumitfeedback";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Your Feedback",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Feedback",
                  hintText: "Please Enter here, your feedback matters to us",
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Thankyou'),
                      content: Text(
                          "Thankyou for proving us feedback your feedback matters to us"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Okay'),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(HomePageScreen.routename);
                          },
                        ),
                      ],
                    ),
                  );

                  Navigator.of(context)
                      .pushReplacementNamed(HomePageScreen.routename);
                },
                child: Text('SUBMIT'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
