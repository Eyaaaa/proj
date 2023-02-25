import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../signup.dart';
import '../sigupPhone.dart';

class ButtonWithTwoChoices extends StatefulWidget {
  @override
  _ButtonWithTwoChoicesState createState() => _ButtonWithTwoChoicesState();
}

class _ButtonWithTwoChoicesState extends State<ButtonWithTwoChoices> {
  bool _isEmailSelected = true;

  void _onEmailSelected() {
    setState(() {
      _isEmailSelected = true;
    });
  }

  void _onPhoneSelected() {
    setState(() {
      _isEmailSelected = false;
    });
  }

  void _onButtonPressed() {
    if (_isEmailSelected) {
      // Action pour le choix Email
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignupPage()
          )
      );
    } else {
      // Action pour le choix Phone
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignuppPage()
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}