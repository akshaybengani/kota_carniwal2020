import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  static const routename = '/supportscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Contact US',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      title: Text(
                        'Chandran M',
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          _launchURL("tel://9486836016");
                          // UrlLauncher.launch("tel://<phone_number>");
                        },
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.call,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      title: Text(
                        'Aman Gautam',
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          _launchURL("tel://8585954490");
                        },
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.call,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      title: Text(
                        'Hemant Dhakad',
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          _launchURL("tel://9079756832");
                        },
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.call,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
