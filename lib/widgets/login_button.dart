import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

  class _LoginButtonState extends State<LoginButton> {
    @override
    Widget build(BuildContext context) {
      return FadeAnimation(1.5, MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {},
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.black
            ),
            borderRadius: BorderRadius.circular(50)
        ),
        child: Text("Login", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
        ),),
      ));
    }
  }
