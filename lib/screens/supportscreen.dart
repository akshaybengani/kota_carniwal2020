import 'package:flutter/material.dart';
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
              const SizedBox(height: 20),
              const Text(
                'Contact US',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      title: const Text(
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
                          child: const Icon(
                            Icons.call,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      title: const Text(
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
                          child: const Icon(
                            Icons.call,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      title: const Text(
                        'Hemant Dhakad',
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          _launchURL("tel://9079756892");
                        },
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.call,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
