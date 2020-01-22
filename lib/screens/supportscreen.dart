import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  static const routename = '/supportscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Get In Touch',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                 SizedBox(height: 20),
                Text('Call Us',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text('+91-9876543210',
                    style: TextStyle(fontSize: 15))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                SizedBox(height: 20),
                Text('Mail Us',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text('support@motion.ac.in',
                    style: TextStyle(fontSize: 15))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
