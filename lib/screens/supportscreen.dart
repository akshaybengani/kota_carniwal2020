import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SupportScreen extends StatelessWidget {
  static const routename = '/supportscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.more_vert),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
              child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Get In Touch',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Share.share('tel:9876543210');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Call Us',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    const Text('+91-9876543210', style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: (){
                  Share.share('support@motion.ac.in', subject: 'Help Needed!!');
                },
                child: Column(
                         children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Mail Us',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    const Text('support@motion.ac.in', style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
