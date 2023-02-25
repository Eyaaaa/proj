import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final VoidCallback onEmailButtonPressed;
  final VoidCallback onPhoneButtonPressed;

  ButtonWidget({required this.onEmailButtonPressed, required this.onPhoneButtonPressed});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _isEmailButtonClicked = false;
  bool _isPhoneButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isEmailButtonClicked = true;
              _isPhoneButtonClicked = false;
            });
            widget.onEmailButtonPressed();
          },
          child: Container(
            width: 120,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isEmailButtonClicked ? Colors.green : Colors.grey[350],
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isPhoneButtonClicked = true;
              _isEmailButtonClicked = false;
            });
            widget.onPhoneButtonPressed();
          },
          child: Container(
            width: 120,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isPhoneButtonClicked ? Colors.green : Colors.grey[350],
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Text(
              'Phone',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
