import 'package:ecommerce_app1/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Color(0x4CE5B1),Color(0x4CE5B1),]
          ),
        ),
        child: Column(

          children: [
            Column(
              children: [

                SizedBox(height:180.0 ),
                Image.asset(
                  "assets/images/black.png",
                  height: 200.0,
                  width: 150.0,
                ),

                SizedBox(height:200.0 ),
              ],
            ),

            CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
