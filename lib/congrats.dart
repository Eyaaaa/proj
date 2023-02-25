import 'dart:async';
import 'package:ecommerce_app1/signin.dart';

import 'package:flutter/material.dart';


import 'main.dart';

class CongratsPage extends StatefulWidget {
  @override
  _CongratsPageState createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(

        MaterialPageRoute(
          builder: (context) => LoginPage (),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(


            child: Column(
              children: <Widget>[
                SizedBox(height: 150),


                Image.asset(
                  'assets/images/check.png',
                  width: 250,
                  height: 250,
                ),


                SizedBox(height: 20),


                Text(
                  'Congratulations',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),


                ),
                SizedBox(height: 25),

                Text(
                  'Your account has been verified',

                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}