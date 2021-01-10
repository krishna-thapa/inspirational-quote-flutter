import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/login/login_page.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

  class _LoginButtonState extends State<LoginButton> {
    @override
    Widget build(BuildContext context) {
      return FadeAnimation(0.2, MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
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
